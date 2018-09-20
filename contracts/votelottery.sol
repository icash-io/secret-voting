pragma solidity ^0.4.18;

import "./Ownable.sol";
import "./SafeMath.sol";
import "./pairing.sol";

contract votelottery is Ownable {
    using Pairing for *;
    using SafeMath for uint256;
    
    struct Voter {
        bool voted;
        bool canClaim;
        bytes32 hashed_ticket;
    }
    mapping(address => Voter) public voters;
    address [] public tickets;
    struct candidate {
        string name;
        uint256 votes;
    }
    candidate[] private candidates;
    
    struct key {
        Pairing.G1Point g1;
        Pairing.G2Point g2;
    }
    key [] public keys;
    
    bool public vote_started;
    bool public vote_is_over;
    bool public claim_is_over;
    bool public at_least_one_claim;
    
    uint256 random_seed;
    
    modifier vote_not_over() {
        require(vote_is_over == false);
        _;
    }
    
    constructor () public {
        vote_started = false;
        vote_is_over = false;
        claim_is_over = false;
        at_least_one_claim = false;
    }
    
    event VoteResult(
        string indexed name,	
        uint indexed votes	
    );
    
    event winnerResult(address _address, uint _amount);
    
    function mulp(uint256 px, uint256 py, uint s) internal returns (Pairing.G1Point r) {
        Pairing.G1Point memory g1 = Pairing.G1Point(px, py);
        r = Pairing.mulp(g1, s);
    }
    function negate(uint256 px, uint256 py) internal returns (Pairing.G1Point r) {
        Pairing.G1Point memory g1 = Pairing.G1Point(px, py);
        r = Pairing.negate(g1);
    }
    
    function addKey(uint256 p1x, uint256 p1y,
    uint256 p2x1, uint256 p2x2, uint256 p2y1, uint256 p2y2) onlyOwner public {
        Pairing.G1Point memory g1 = Pairing.G1Point(p1x, p1y);
        Pairing.G2Point memory g2 = Pairing.G2Point([p2x1,p2x2],[p2y1,p2y2]);
        keys.push(key(g1, g2));
    }
    function verify(uint256 p1x, uint256 p1y,
    uint256 p2x1, uint256 p2x2, uint256 p2y1, uint256 p2y2) internal returns (bool res) {
        Pairing.G1Point memory g1 = Pairing.G1Point(p1x, p1y);
        Pairing.G2Point memory g2 = Pairing.G2Point([p2x1,p2x2],[p2y1,p2y2]);
        uint256 length = keys.length;
        res = false;
        for (uint256 i = 0; i < length; i = i.add(1)) {
            if (Pairing.pairingProd2(g1, g2, keys[i].g1, keys[i].g2))
            {
                res = true;
            }
        }
        require(res == true);
    }
    
    function renounceOwnership() public onlyOwner {
        require(vote_is_over == true);
        super.renounceOwnership();
    }
    
    function () external onlyOwner vote_not_over payable {
        require(vote_started == false);
    }
    
    function balance() public constant returns(uint256)  {
        return address(this).balance;
    } 
    
   function addCandidate(string candidate_name) onlyOwner vote_not_over public {
        require(bytes(candidate_name).length > 0);
        require(vote_started == false);
        uint256 length = candidates.length;
        for (uint256 i = 0; i < length; i = i.add(1)) {
            require(keccak256(bytes(candidate_name)) != keccak256(bytes(candidates[i].name)));
        }
        candidates.push(candidate(candidate_name, 0));
    }
    
   function startVote() onlyOwner vote_not_over public {
        require(candidates.length > 0);
        require(vote_started == false);
        vote_started = true;
    }
    
   function endVote() onlyOwner vote_not_over public {
        require(vote_started == true);
        vote_is_over = true;
        
        getResult();
    }
    
    function claimTicket(uint256 ticket) public {
        require(vote_is_over == true);
        require(claim_is_over == false);
        require(voters[msg.sender].canClaim == true);
        require(voters[msg.sender].hashed_ticket == keccak256(abi.encodePacked(msg.sender, ticket)));
        voters[msg.sender].canClaim = false;
        random_seed = random_seed ^ ticket;
        at_least_one_claim = true;
    }
    
    function endClaim() onlyOwner public {
        require(vote_is_over == true);
        require(at_least_one_claim == true);
        claim_is_over = true;

        address winner = findWinner(random_seed, tickets.length);
        transferTotalEtherToWinner(winner);
    }
    
    function findWinner(uint256 _random_seed, uint256 num_tickets) internal view returns (address) {
        for (int i = 0; i < 10; i++) {
            uint256 winner_idx = _random_seed % num_tickets;
            address winner_addr = tickets[winner_idx];
            if (voters[winner_addr].canClaim == false) {
                // we found a winner 
                return winner_addr;
            }
            // this person could have been a winner but didn't claim
            _random_seed = uint256(keccak256(abi.encodePacked(_random_seed, winner_addr)));
            continue;
        }
        // linear search until winner is found
        while (true) {
            winner_idx = winner_idx.add(1) % num_tickets;
            winner_addr = tickets[winner_idx];
            if (voters[winner_addr].canClaim == false) {
                return winner_addr;
            }
        }
    }

    function vote(uint256 candidate_, bytes32 _hashed_ticket, uint256 p1x, uint256 p1y,
    uint256 p2x1, uint256 p2x2, uint256 p2y1, uint256 p2y2) vote_not_over public {
        require(vote_started == true);
        require(voters[msg.sender].voted == false);
        require(verify(p1x,p1y,p2x1,p2x2,p2y1,p2y2) == true);

        voters[msg.sender].voted = true;
        voters[msg.sender].canClaim = true;
        voters[msg.sender].hashed_ticket = _hashed_ticket;
        candidates[candidate_].votes = candidates[candidate_].votes.add(1);
        tickets.push(msg.sender);
    }
    
    function transferTotalEtherToWinner(address _winner) public onlyOwner payable {
        
        require(balance() > 0);
        uint256 amount = balance();
        _winner.transfer(amount);
        emit winnerResult(_winner, amount);
    }
    
    function getResult() private {	
        for(uint256 p = 0; p < candidates.length ; p++) {	
            emit VoteResult(candidates[p].name, candidates[p].votes);    	
        }
    }
}
