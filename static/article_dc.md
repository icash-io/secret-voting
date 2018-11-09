# **5 Key Takeaways from Devcon4**

In this document I will cover the highliglhts of my trip to Prague for the Devcon4 conference. This conference was a showcase for all major players involved in building blockchain technology.  

![devcon4BIG](https://i.imgur.com/Hiw0uJI.jpg)

I started off the day with an interview about iCash with Sasha at BIG Crypto. We covered a variety of topics: his entertaining story on how he first heard about the iCash team while at Consensus Singapore, an indepth look at the most prevalent trends in blockchain technology, and how iCash will scale it's blockchain protocol for dispute resolution. 

![](https://i.imgur.com/8SA0Gai.png)

We'll be providing an update to this article in the next few days with a link to the full video clip.    
  

At the end of the conversation, he asked me to predict the 5 most important discussion points gained from attending the conference. In the rest of this article, I'm sharing those points after having an amazing week of learning from the best of the best. 








# 1. The Future of Privacy and Scalability: ZK Starks

### **ZK Starks**

Attended ZK Stark meeting. There I was able to represent iCash and talk to them about joining their partner program. They actively help projects. They need a technical spec to see whether or not iCash would be a good fit for partnership. 

![](https://i.imgur.com/uaFxpOi.png)
Me with Starkware CTO Oren Katz

Their key advantage is that they are a monopoly both on ZK Stark knowledge and development efforts. Starks will be commonplace and be a scaling solultion for Ethereum. 


The most packed talk of the conference was the Starkware lecture about ZK Starks. In a room that typically fits 150, I sat/stood with over 300 people cramming in to the space listening and getting the firsthand knowledge of the latest development in ZK Stark technology.

![](https://i.imgur.com/46Y47Eg.jpg)

These are comparisons of Stark verifiers. What does stark verifier do? 95% of the process is checking hashes. Prover commits to large data sets. Verifier checks small number of linear algebra equations. 

### Significance to this

We now apply this line of thinking using Stark verifiers to now enable scalable blockchains. The hash check is done showing commitments (transactions on the blockchain) that can be traced back to the merkle root is correct. 

Previously in the realm of blockchain scalabililty tech, if some one shows you a proof that corresponded to 10k Pedersen Hashes, one would ultimately need to verify each one by one, with computational complexity of `O(n); n = 10,000;`. 

Now, with the advent of Stark verifiers, only `1200 to 1900` hashes would need to be checked, improving verification time from linear to  sublinear computational complelxity ` ~O(log n)`. That results in a massive performance boost for light client validation, which allows blockchains like Ethereum to be re-architected to distribute heavy computation load onto the light client network and enhance throughput and overall scalability.

Following the lecture was a 40 minute live demo, where they demonstrated their scalabillity techniques to generate and verify Starks on their laptop and even on their mobile device! 

### Formalized in a rough spec

> Prove that I know the merkle path from a leaf to a root, 2 leaves exist in a specific merkle root. (Equivalent also to proving a shielded transaction.) 

**3 arguments required**:   
Leaf hash   
Tree depth  
Security hash  

**Given a GUI, specify:**  
Merkle root  
Leaf hash  
Tree depth  
Proof (tx hash or signature)  


![](https://i.imgur.com/Z6HWH7m.jpg)

Comparison of various encryption algorithms used to generate `Algebraic Intermediate Representations`, a building block in ZK Starks. 


# 2. The need for Decentralized Trust 
## A blockchain system must properly decentralize trust in all layers in the protocol 
## Devcon4 Day 1



![](https://i.imgur.com/88w9Udo.png)

![](https://i.imgur.com/chv0N1M.png)

[Process for Arbitration on Smart Contracts](https://medium.com/icash-io/processes-for-arbitration-on-smart-contracts-a9a20905dbfe)
  
# Night time events

### **Origin Protocol**

Met up with Origin Protocol founders Matt Liu and Josh Fraser. We talked about ERC725 tokens. I asked them if they were nervous about the lack of Ethereum scaling being a problem blocking their success. They are currently most focused on user acquisition. 

We have institutional partners already. They want to partner with us and see that we have app's with users. 

![originfounders](https://i.imgur.com/m46y89k.png)  

# 3. **Vitalik Buterin Talk**

Devcon4 Day 2, first keynote. On this day was also Bitcoin's 10 year anniversary. 

Vitalik talked Ethereum 2.0, and the centerpiece of his talk was about a blockchain system called the "beacon chain". The beacon chain is the "main chain" of the PoS system. 

It's 3 core functions are:  
* Store and maintain the set of active, queued, and slashed validators
* Process crosslinks
* Process its own block by block consensus, as well as the finality gadget. 



![](https://i.imgur.com/scMP3T1.png)

My notes for the talk:   
[Vitailk Buterin Speech](https://gist.github.com/lingqingmeng/ead77ab84fed1152545b4e905897cf5d)

What this means for iCash is that we are on the right track. I'm getting confirmations from mutliple sources, such as my in person meeting with Parity VP of Product, that Beacon chains and relay chains are the future of scalabiilty in the near term. 

The future will also be in eWASM, which is pushed forward by Dr. Gavin Wood (Ethereum cofounder) and his team at Parity. eWASM will make Smart Contract development more secure, cheaper, faster to develop (being able to re-use existing libraries that have been around for 30 years), and most importantly will improve runtime performance of the Ethereum Virtual Machine.  


# 4. CTO Investor Dinner




### **What went down**

![](https://i.imgur.com/CQ9jMp8.png)

I introduced him with K3/LL's CSO. This is a guy who has already raised multiple rounds of 3-5 million USD for an emerging market telecom business providing WiFi to Africa's upperclass at a premium. He wants to take his business model and bring potentiallly hundreds of millilons of users to the blockchain via Security Tokens. 

### **Attendee thoughts**
Zane Witherspoon, [Nov 6, 2018 11:59:00]:
> It was really great to discuss the idea of network livelieness with the VP of Eng of Algorand

> And talking with the technical leads of different investment firms was really interesting as well

Hyungsuk Kang, Ethereum Foundation Scholar

> I talked with Makoto from ENS team and talked about its use case for IoT. ENS team was intereseted to talk about my suggestion for IoT further since ENS team is desperately looking for a use case. 

> I am planning to reach out to Nick Johnson to talk about this.  Circularize CEO and I had very interesting conversation on implementation of blockchain to build circular economy, and he is looking for blockchain network to develop it. He might come to Korea next year March. Future relationship can be developed. 

# **5. Algorand**

Algorand is a high throughput blockchain. THey are often compared to Dfinity (essentially, the most hyped high throughput blockchain that does _not_ use dPOS). Their VP of Engineering discussed with me the technical details of their project, which has a 500 milllion dollar valuation. 

They see themsevles as platform that can handle accounts and transactions as welll as smart contracts. Their founder is an MIT professor actually came up with the concept and methodology of their consensus 20 years ago. Algorand may be a pubilc permissionless blockchain (that can be configured to be private permissioned) that can handlle the scalle and complexity that iCash requires. Not only that, but he is very much in aggreeance that Algorand is proactively looking for end usecase DApps and Protocosl to be built on their platform. 

![](https://i.imgur.com/0RPNS3U.png)

Currently, they are also in the infrastructure phase. They need desktop wallets, mobile DApps, DEX's, Centralized Exchanges. Currentlyl their testnet supports sending (signing) and receiving Algorand native currency transactions. It also supports their model non-binding provably fair staking method of block production. 

Notable is that Naveed really opened up about working with iCash after I mentioned our deal with Hashgraph. He invited me to their private meetup, even Roman Storm's crew couldn't get past the guestilst. I still used the oppurtunity to catch up on the latest tech he's been working on. 


