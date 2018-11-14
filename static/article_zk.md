# Requirements

## Customer requirements
* Client-side proof generation with acceptable performance
* Easy for average users
* Security

## Our requirements/nice-to-haves
* Easy development across all platforms
* Easy deployment
* Good performance

For proof generation, libsnark (https://github.com/zcash/libsnark) appears to be the only viable choice. There are other  implementations of of ZK-SNARK.

https://github.com/IAIK/Picnic

https://github.com/JacobEberhardt/ZoKrates 

However, these implementations are immature/experimental. ZK-STARK does not have any production-level implementations at this point (https://github.com/elibensasson/libSTARK is the only one, but not production-ready).

# Option 1

We will have all the code in javascript and deliver to customers in browser only. Proof generation will be done through libsnark, but compiled to javascript in asm.js form. This makes for easy integration with contracts through web3.

The UI will be built with whatever framework that gives our developers maximum productivity e.g. React.

This approach will be easy for average users to use. All the user needs to do to use the UI is to connect to a website. The user will be presented with a few boxes to enter the secret information to generate a proof. The user will then be asked to choose the candidate to whom the user wants to vote for. Upon confirmation, the proof and the voter’s choice will be sent to be mined. The user will be presented with a waiting screen in-browser until the transaction has been mined.

## Pros

* Easy development

Adhering to web standards such as javascript will ensure compatibility across all browsers supporting javascript, and OSes. This means we will only have one set of code to deal with, and not have to worry too much about compatibility. The frontend can be built with well-understood frameworks.

* Security

All the information needed to generate proofs stay in local browser, so as long as the machine and the browser themselves are secure, the user information stays secure. Since asm.js is a subset of javascript and is therefore human-readable, the client-side code can even be audited by external parties for security.

## Cons

* Potentially low performance

While asm.js form javascript is known to be highly optimized, it may not be sufficiently fast for proof generation depending on the user machine specs or the browser. This would require benchmarking on a wide scale to find out.

# Option 2

Option 2 is the same as Option 1, except that libsnark will be compiled to webassembly instead of asm.js. Webassembly known to often show higher performance for CPU-intensive workloads, so if asm.js performance is not sufficient, webassembly could be a viable alternative.

From user perspective, nothing changes compared to Option 1. The user may have better experience with this approach if the performance difference is visible.

Although webassembly is likely to have higher performance, this may not be consistent across all browsers, OSes and machines. Broach benchmarking would be required.

## Pros

This approach retains most of the advantages for portable development and security from Option 1. 

## Cons

* Increased complexity

Webassembly needs to go through more hoops to deploy than javascript. Webassembly requires javascript to load and compile it first, and then it can be deployed. Webassembly also has no direct access to platform APIs, so it has to go through javascript.

* Not auditable

Webassembly is in binary format, so it will not be human-readable for audits.


# Option 3

If even Option 2 cannot satisfy performance requirements, natively compiled libsnark will have to be employed. 

One way to do this would be to design the client as an Electron/React native app. The UI will be specifically built separately for desktop and mobile applications. Libsnark will be packaged as a Node.js add-on for Electron and Native module for React Native. 

The user experience will be similar to other options, except that the user launches an application instead of visiting a website.

## Pros
* Higher performance

## Cons
* Significantly higher complexity for development

The applications must be built for desktop and mobile separately. While most of the code will be shared, the development team must manage Electron app, React native app, Node.js add-on and Native module.

* Updates 

Since the code is not delivered on-demand through browser, some updates may be necessary.
