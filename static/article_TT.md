---  
title: ZKP in iCash  
date: 2018-09-12 16:44:48  
author: Ling Qing Meng  
tags:  
- Projects  
- AI  
---  
  
# How iCash protects votes and voter identity in it's Proof of Trust protocol

## Introduction
The Proof of Trust protocol enables network participants, or Delegates, to individually input data and achieve distributed consensus on a live verifiable event.  Their voting needs to be done in private, which is difficult on an open platform such as Ethereum. We will need to use zero-knowledge proofs to provide this function. Throughout the following explanation, we will use the example of an on-chain anonymous voting election with three running candidates: Alice, Bob, and Charlie.

Here we have a voting contract that gives each voter a chance to win a lottery. This is an example way to encourage people to vote without revealing their identities. 

This is particularly useful for creating a decentralized voting protocol that verifies that live verifiable events.


## Phase 1: Setup

First, we deploy the [votelottery](https://github.com/icash-io/secret-voting) contract and send ETH to it. The ETH sent to the contract will be the reward given to the lottery winner.

After the contract is deployed, we set up the candidates for the election using method `addCandidate()`:   
 
  * Alice 
  * Bob
  * Charlie



In the next step, we use the `addKey()` function to add keys for the voters. The “keys” are [points on an elliptical curve](https://en.wikipedia.org/wiki/Counting_points_on_elliptic_curves), which  are specifically chosen so that we will later be able to “match” with another set of points. Only people with a matching set of points are allowed to vote.  Without knowing unique secret information belonging to a particular voter, it will be extremely difficult for someone to determine a set of matching points in order to gain voting rights. The `addKey()` function: :


```

function addKey  (
  uint256 p1x, 
  uint256 p1y, 
  uint256 p2x1, 
  uint256 p2x2, 
  uint256 p2y1, 
  uint256 p2y2
) 
  onlyOwner 
  public 
{
  Pairing.G1Point memory g1 = Pairing.G1Point(p1x, p1y);
  Pairing.G2Point memory g2 = Pairing.G2Point([p2x1,p2x2],[p2y1,p2y2]);
  keys.push(key(g1, g2));
}

```

We rearrange the list of points into 3 points, and push it into an array of keys in the contract. It will be referred to later to check if someone has a right to vote.

We then use the `addCandidate()` function to add the wallet address of each voter. Only the addresses added by `addCandidate()` will be allowed to vote. There is no connection between the wallet addresses and the keys that were added earlier; these are separate pieces of information, and only the members who have both a recognized wallet address AND a valid key will be able to vote. Each voter also holds an attribute called `hashed_ticket`, which is a hash of the voter’s address concatenated with a number chosen by the voter.   

The `hashed_ticket` serves two purposes.   
  
It supplies entropy for random number generation for the lottery, and it is used for the lottery draw. Blockchain is a deterministic state machine, which makes it difficult to produce randomness without being predictable. By hashing the number of the voter’s choice, we make this number “secret” while still public.   
   

After the election, all voters will be required to reveal their number to both enter the draw and supply entropy. Given that the true number was known to no one but the voter and the vast number of voters, these numbers serve as a good source of entropy while being unpredictable. Until then, these numbers will be stored in a map. Note that voters can only be added before the vote has started.    
  

```
function addCandidate(address new_voter, bytes32 _hashed_ticket) onlyOwner vote_not_over public {
   require(vote_started == false);
   require(new_voter != address(0));

   voters[new_voter].canVote = true;
   voters[new_voter].canClaim = true;
   voters[new_voter].hashed_ticket = _hashed_ticket;
}

```

Which brings us to the next step, `startVote()`. As the name implies, the vote begins with a call to this function. The election booths are open.   


```
function startVote() onlyOwner vote_not_over public {

   require(candidates.length > 0);
   require(vote_started == false);
   vote_started = true;
}
```

## Phase 2: Commit

All of the functions used so far have been marked with modifier `onlyOwner`. This means that only the owner of the contract, for example, the election committee, is allowed to call these functions. Without this restriction, anyone could add unlimited duplicates of oneself as voters!
   
Now, we will switch the account to the first voter and cast a vote with the `vote()` function. We pass the following required information into the function: the candidate number of the preferred candidate (Alice, Bob, Charlie / 1, 2, 3) and the set of elliptical curve points that demonstrate the voter’s right to vote. Verification of a voter’s right to vote happens in the following function:  


```
function verify(uint256 p1x, uint256 p1y, uint256 p2x1, uint256 p2x2, uint256 p2y1, uint256 p2y2) internal returns (bool res) {
   Pairing.G1Point memory g1 = Pairing.G1Point(p1x, p1y);
   Pairing.G2Point memory g2 = Pairing.G2Point([p2x1,p2x2],[p2y1,p2y2]);
   uint256 length = keys.length;
   res = false;
   for (uint256 i = 0; i < length; i = i.add(1)) {
       if (Pairing.pairingProd2(g1, g2, keys[i].g1, keys[i].g2)) {
           res = true;
       }
   }
   require(res == true);
}
```
  

The supplied numbers are arranged into elliptical curve points and matched against the list of known keys that were supplied originally through `addKey()` function. The actual computation required to verify a match between two sets of points is in `Pairing.pairingProd2()` function. This vote will only be accepted as legitimate if there is a matching key.


> **Security Considerations**  

> In the function `verify()`, we do a linear search for a matching key. Any interested miner could potentially look into the transaction and make links between the key and the wallet address of the voter. Whether that gives the perpetrator interesting information would depend, yet again, on the offline security of the whole system.
   
So the verification will work, but what is the meaning of this? Note that we are dealing with abstract pieces of information called “keys.” These keys serve as social security cards online, but without revealing the social security numbers. 

Zero-knowledge proof is used here to prove one’s identity without revealing one’s identity.  


## Phase 3: Reveal  

After all of the votes have been cast, the owner of the vote contract ends the vote.  No party other than the owner can end the vote. Finally, the winner of the vote is known by tallying the hashed votes. By referring to the logs, we can see that the second candidate, Bob, received  the most, 2 votes; therefore Bob is the winner.   
  
At the same time, ticket claims have started. Each voter will now enter his number that was kept hidden under hash.  


```
function claimTicket(uint256 ticket) public {
   require(vote_is_over == true);
   require(claim_is_over == false);
   require(voters[msg.sender].canClaim == true);
   require(voters[msg.sender].hashed_ticket == keccak256(abi.encodePacked(msg.sender, ticket)));
   
   voters[msg.sender].canClaim = false;
   random_seed = random_seed ^ ticket;
   at_least_one_claim = true;
}
```

In `claimTicket()` function, the ticket will be hashed together with the sender’s address. If the result is what the voter registered originally, the voter will have the right to enter the lottery with his ticket number. Note also that the random seed is updated with the ticket number which was kept secret until now. If the voter does not or cannot provide the original ticket number, then he will not be entered into the lottery draw.   

Once all claims have been entered (or the election committee calls the end), the winner of the lottery is announced.   
  
```
function endClaim() onlyOwner public {
   require(vote_is_over == true);
   require(at_least_one_claim == true);

   claim_is_over = true;
   address winner = findWinner(random_seed, tickets.length);
   transferTotalEtherToWinner(winner);

}
``` 
 
As soon as `endClaim()` is called, the winner will be with `findWinner()` function and the prize ETH will be transferred to the winner. Note how `findWinner()` function is taking the random seed collected from all claiming voters as an input. This means it will be very difficult to influence the outcome of this vote during the voting phase.   
  
### Conclusion
  
In summary, we were able to come up with a voting system that does not reveal the voters’ identities using zero-knowledge proofs. Without it, it would have been very difficult to secure the identities on the blockchain without leaving some chance of having their 'anonymous' vote exposed. 

Because the blockchain is an immutable ledger, the data you store on it is traceable back to its originator. This happens with both the pseudoanonymous UTXO or account and balances design.  Smart contract function calls and cryptocurrency transactions tools do exist that use forensic analysis and machine learning to trace all previous activity of a specific UserId.
  
> One can ask, aren’t wallet address already a good proof of identity?

Yes, it is.  
  
The solution for security is to keep the entity registering the keys and the entity assigning wallet addresses separate. A secure system is only as strong as its weakest link, and we have to consider attacks even before votes on the blockchain begin.  By applying Zero knowledge proofs in the above fashion, we can secure the votes and voter identities of Users in a distributed open ledger.  This allows distributed validation and transparency without sacrificing reliability or trust - the exact objective of the Proof of Trust protocol.



# References

Douglas Heaven. April 19, 2018. [https://www.technologyreview.com/s/610807/sitting-with-the-cyber-sleuths-who-track-cryptocurrency-criminals/](https://www.technologyreview.com/s/610807/sitting-with-the-cyber-sleuths-who-track-cryptocurrency-criminals/)
