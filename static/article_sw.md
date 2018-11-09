### Notes from the Starkware Talk

![](https://i.imgur.com/46Y47Eg.jpg)
> Comparison of STARKs with BulleltProofs



These are comparisons of verifiers for Zero Knowledge Proofs. 

### What does Stark/Bulletproof verifiers enable?

Bulletproofs have recently been implemented in Monero, resulting in overall increased performance.

ZK Starks are non-interactive zero-knowledge proofs are seen as a scaling solution planned to be implemented in Ethereum 2.0 and ZCash. 

![](https://i.imgur.com/Z6HWH7m.jpg)
> 95% of the process is checking hashes.


### In short, how does it function? 

A prover commits to large data sets, claiming that the data is authentic and trusted. Verifier checks small number of linear algebra equations. 


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




Comparison of various encryption algorithms used to generate `Algebraic Intermediate Representations`, a building block in ZK Starks. 
