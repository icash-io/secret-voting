# **5 Key Takeaways from Devcon4**

In this document I will cover the highliglhts of my trip to Prague for the Devcon4 conference. This conference was a showcase for all major players involved in building blockchain technology.  

![devcon4BIG](https://i.imgur.com/Hiw0uJI.jpg)

I started off the day with an interview about iCash with Sasha at BIG Crypto. We covered a variety of topics: his entertaining story on how he first heard about the iCash team while at Consensus Singapore, an indepth look at the most prevalent trends in blockchain technology, and how iCash will scale it's blockchain protocol for dispute resolution. 

![](https://i.imgur.com/8SA0Gai.png)

We'll be providing an update to this article in the next few days with a link to the full video clip.    
  

At the end of the conversation, he asked me to predict the 5 most important discussion points gained from attending the conference. In the rest of this article, I'm sharing those points after having an amazing week of learning from the best of the best. 








# 1. The Future of Privacy and Scalability: ZK Starks

### **ZK Starks**


![](https://i.imgur.com/yDjpYcE.jpg)



The most packed talk of the conference was the Starkware lecture about ZK Starks. In a room that typically fits 150, I sat/stood with over 300 people cramming in to the space listening and getting the firsthand knowledge of the latest development in ZK Stark technology.

![](https://i.imgur.com/uaFxpOi.png)
> Meeting Starkware CTO Oren Katz.


I learned that they have a  partner program where Starkware actively helps project design their protocol. He asked me more about how [iCash uses ZK Snark technology to build the privacy layer for smart contract contestations](https://www.youtube.com/watch?v=hvFsXK58xuE). 

Starks will be commonplace and be a scaling solution for Ethereum and given the right partnership oppurtunity, we would not hesitate to build our tech robustly to be the best long term dominant solution.   








# 2. The need for Decentralized Trust 
## A blockchain system must properly decentralize trust in all layers in the protocol 
## Devcon4 Day 1





![](https://i.imgur.com/chv0N1M.png)



### **Handshake (HNS)**

I noticed a rising interest in Decentralized DNS. There seems to be a recurring theme that a secure network system should be built with proper first principles. In order to truly decentralized the internet, one from the ground up using first principles; trust must be established at all layers in the protocol stack starting with root. 

In the case of HNS, the root or backbone of their protocol is  the Domain Name System. 

This idea has been around since the early days of Bitcoin. Handshake (HNS) is a relatively new project headed by Joseph Poon that has both raised significant funding and been donating generously to open source software foundations that have been around since the early days. I learned that it exists today as a fork of bitcoin with a different approach to mining.

> Handshake works seamlessly with the existing DNS system. The domain names of the top 100,000 websites on the internet are being set aside for their legitimate owners to claim on Handshake [3]. 

[Handshake Paper](https://handshake.org/files/handshake.txt)


The fundamental issue that Handshake is solving, is that in order to trust any website, one must also trust the Certificate Authority that generated the TLS or SSL certificate that validated the authenticity of any given website to the browser.   


### **Ethereum Name Service**

Ethereum Name Service (ENS) is the domain name service that gives an alphabetic character name to your Ethereum address or dApp. They announced that apart from the .eth domain, two other top-level domains (TLDs) are becoming available in the next weeks: “.xyz” and “.luxe” are purchasable via traditional DNS registrars. The process of ENS registry.  

![Congress Center Prague](https://i.imgur.com/88w9Udo.png)
> At the Congress Center in Prague, bright and early



### **Origin Protocol**

We talked about a mechanism to allow smart contracts to allow interactions from reputable people. They have submitted a proposal for ERC725 tokens to allow for that trusted transfer.  

![originfounders](https://i.imgur.com/m46y89k.png)  
> Met up with Origin Protocol cofounders Matt Liu and Josh Fraser. 

### **Day 1 Closing Thoughts**

In order to truly decentralized the internet, one from the ground up using first principles; trust must be established at all layers in the protocol stack starting with root. 

Thus, for Smart Contracts to be fully trusted and decentralized, they too must have a protocol to secure incoming and outgoing data (parameters, execution logic) such that the authenticity or validity can be proved in a deterministic manner - and because of that, [there exist a deterministic way to contest and reclaim value that otherwise would have been lost](https://medium.com/icash-io/processes-for-arbitration-on-smart-contracts-a9a20905dbfe).


# 3. **Vitalik Buterin Talk**

### Devcon4 Day 2, the future of Ethereum

Vitalik talked Ethereum 2.0 (Serenity), and the centerpiece of his talk was about a blockchain system called the "beacon chain". The beacon chain is the "main chain" of the PoS system. 

It's 3 core functions are:  
* Store and maintain the set of active, queued, and slashed validators
* Process crosslinks
* Process its own block by block consensus, as well as the finality gadget. 



![](https://i.imgur.com/scMP3T1.png)

My notes for the talk:   
[Vitailk Buterin Speech](https://gist.github.com/lingqingmeng/ead77ab84fed1152545b4e905897cf5d)

What this means for iCash is that we are on the right track. I'm getting confirmations from mutliple sources, such as my in person meeting with Parity VP of Product, that Beacon chains and relay chains are the future of scalabiilty in the near term. 

The Smart Contracts of the future will be more lilkely written eWASM over Solildity. 


eWasm is based off of WebAssembly(Wasm), a new Assembly standard being built for the web. The main advantage of using Wasm is performance (both speed and size). 

> Wasm is a kin to LLVM IR and Low Level Instruction Set Architectures (ISAs). It is an defined as an Abstract Syntax Tree (AST) which has a textual representation using s-expressions. As an AST it has some higher level semantics than pure hardware ISAs. Including functions and basic flow control. Wasm is not finished a specification and still in flux. This EIP suggest using a subset of wasm to allow us to tailor the semantics to Ethereum. This spec is designed so that the minimum amount of changes a wasm VM would need to be implemented. This should make existing implementations of wasm easy to integrate and provide a way to run Ethereum flavored wasm on a unmodified wasm VM.  

[Source: EIP-140](https://github.com/ethereum/EIPs/issues/48)


The EIP first came out in May, since then it has been _additionally_ pushed forward by Dr. Gavin Wood (Ethereum cofounder) and his team at Parity. eWASM will make Smart Contract development more secure, cheaper, faster to develop (being able to re-use existing libraries that have been around for 30 years), and most importantly will improve runtime performance of the Ethereum Virtual Machine.  


# 4. **CTO Investor Dinner**

I participated in an exclusive dinner for blockchain CTOs during Devcon 4.

There I led a discussion on iCash's Proof of Trust Protocol, [dispute arbitration and it's importance in the ecosystem](https://medium.com/icash-io/processes-for-arbitration-on-smart-contracts-a9a20905dbfe), how Security Tokens bring extreme value to user-based top down platforms built on blockchain, securities in blockchain, and more.



### **What went down**

This event brought together the best and brightest of the space, to enjoy a night away from the hectic schedules of Devcon 4 attendees. It created an intimate setting where after every conversation, a CTO could walk away feeling like they could freely express their ideas and learn from each other without the daily pressures of business and competition. 

![](https://i.imgur.com/CQ9jMp8.png)


### **Attendee thoughts**



> It was really great to discuss the idea of network livelieness with the VP of Eng of Algorand
> 
> And talking with the technical leads of different investment firms was really interesting as well
  
Zane Witherspoon, CTO at Dispatch Labs


> I talked with Makoto from ENS team and talked about its use case for IoT. ENS team was intereseted to talk about my suggestion for IoT further since ENS team is desperately looking for a use case. 
> 
> I am planning to reach out to Nick Johnson to talk about this.  Circularize CEO and I had very interesting conversation on implementation of blockchain to build circular economy, and he is looking for blockchain network to develop it. He might come to Korea next year March. Future relationship can be developed. 

Hyungsuk Kang, Ethereum Foundation Research Scholar

# **5. Adoption and Partnerships**

### Algorand Meetup
Algorand is a high throughput blockchain. THey are often compared to Dfinity (essentially an well-regarded decentralized and high throughput blockchain). 

![](https://i.imgur.com/0RPNS3U.png)
Had a chance to discuss with their Founder Silvia and VP of Engineering Naveed the technical details of their project.

They see themsevles as platform that can handle accounts and transactions as welll as smart contracts. Their founder is an MIT professor actually came up with the concept and methodology of their consensus 20 years ago. Algorand may be a pubilc permissionless blockchain (that can be configured to be private permissioned) that can handlle the scale and complexity that iCash requires. Not only that, but he is very much in aggreeance that Algorand is proactively looking for end usecase DApps and Protocols to be built on their platform. 


Currently, they are also in the infrastructure phase. They need desktop wallets, mobile DApps, DEX's, Centralized Exchanges. Currently their testnet supports sending (signing) and receiving Algorand native currency transactions. It also supports their model of non-binding provably fair staking method of block production. 



# **Conclusion**

There  will be ideas exchanged, and partnerships forged, that completely change the trajectory of the space as a whole. With many of the best and brightest attending this event, I'm grateful to celebrate and learn from this collection of amazing human beings as we move blockchain technology into the mainstream. 