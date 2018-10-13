# ZKP Secret Voting Implementation

Demo video during ETH San Francisco Hackathon: [![](https://i.imgur.com/yDX48Vi.png)](https://www.youtube.com/watch?v=5sXDem_YUw0&t=287s)   
Demo video during the Blockparty 2 Hackathon.  

[Video demo 1](https://www.useloom.com/share/b300e33197d341d4a30552f150d955bd)    
https://www.useloom.com/share/b300e33197d341d4a30552f150d955bd
  
[Video demo 2](https://www.useloom.com/share/a7fa2fd8f9f741de8c2e134fa5cd730e)  
https://www.useloom.com/share/a7fa2fd8f9f741de8c2e134fa5cd730e    
  
Also viewable: [youtube channel](https://youtu.be/PGgE1TQl9Kk)  
  
iCash CTO Ling Qing Meng was asked to speak and mentor at Block Party 2 in Seoul, Korea this July. During this event, Ling was asked to deliver a speech regarding iCash, and their implementation of Zero Knowledge Proofs in Voting. Part of this event saw the students broken into teams, requiring them to all conceptualize, and build a working blockchain based project in 2 days. Ling oversaw the winning team's project outline and build, in which they implemented ZK Proofs. 

![alt text](https://i.imgur.com/doxOtL3.jpg) 

![al text](https://i.imgur.com/2tcOAql.jpg)


## How do zero-knowledge proofs work?
The best way to explain the process of zero-knowledge proofs is with a non-digital example which is, of course, far from the complexity of zero-knowledge proofs but very well explains how they work.

> Let us assume there is a blind person and two balls, one black and one white. You then would like to prove to the blind person that these balls are indeed of differing colors without revealing the individual colors of each ball.


> For this, you ask the blind person to hide both balls under the table and bring one ball back up for you to see. After that, he should hide the ball back under the table and then either show the same ball or the other one. As a result, you can prove to the blind person that the colors are different by saying whether he changed the balls under the table or not.

> Obviously, the other person might think that you were just lucky and is not yet completely convinced that both balls have indeed different colors. Zero-knowledge proofs solve this problem by repeating the experiment over and over again. After every round, your chance of being consistently right by pure luck goes down by half. So with 5 rounds, you have a 1 in 32 chance of successfully faking. With 10 rounds, it is 1 in 1024, and with 20 rounds, it is about one in a million. This way one can reach any probabilistic level of proof that is desired, although an absolute certainty can never be achieved.

Actual zero-knowledge proofs do not deal with balls, of course, but proof the validity of any kind of data. This includes financial data (transactions) or personal data (passwords, names, etc.).

In mid-October 2017, part of the current iCash Development team built JPMorgan’s Quorum (its Ethereum-derived, permissioned blockchain platform) introduced the first integration of a zero-knowledge security layer (ZSL) into its enterprise blockchain.

## Methods

### addKey() 

The `addKey()` function will add points on the elliptical curve (as necessary with elliptical curve implementation of ZKP) corresponding to SOMEONE with the right to vote.  
  
The identity of this person is not known at this point, only the owner of the contract (most likely the administration body of this entire vote). This happens for every person with the right to vote, so this forms a pool of known identities.  
  
### vote()  

The `vote()` function will internally call `verify()` to try to "match" the new set of elliptical points with a the pool of known proof of identities already added through `addKey()`.   

### verify()

Calls `pairingProd2()` which calls `pairing()`. Returns the result of computing the elliptic curve pairing check.  

## Assumptions  

[ZKP Keys](https://github.com/icash-io/secret-voting/blob/master/zkp-keys)   

Hard coded elliptic curve points.    
  
[Voters](https://github.com/icash-io/secret-voting/blob/master/voters.txt)  
  
The first row is the public address of the account signing the transaction.  


---


# Potential Applications

This has many potential applications, from using the blockchain agency as a mediator of institutional transactions to cloaking large sum balances and transactions away from the attention of maliciously prying eyes, preventing bandwagon and bot-activated “whales” effects to complementary scaling solutions and possibly engaging the blockchain as a kind of malware detector.

And possibly even more broadly to how the most precious societal resource of trust as such is re-articulated and behaviourally translated back in facilitating human cooperation in game theoretical scenarios previously not in equilibrium.


References
1. On Zero Knowledge Proofs | Argon Group (https://medium.com/@argongroup/on-zero-knowledge-proofs-in-blockchains-14c48cfd1dd1) 
2. Zero Knowledge Proofs | Coin Bureau (https://www.coinbureau.com/education/zero-knowledge-proofs-zksnarks/)
