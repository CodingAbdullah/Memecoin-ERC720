![MarineGEO circle logo](https://trufflesuite.com/img/truffle-logo-dark.svg "MarineGEO logo")


[![npm](https://img.shields.io/npm/v/truffle.svg)](https://www.npmjs.com/package/truffle)
[![npm](https://img.shields.io/npm/dm/truffle.svg)](https://www.npmjs.com/package/truffle)
[![Join the chat at https://gitter.im/consensys/truffle](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/consensys/truffle?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Coverage Status](https://coveralls.io/repos/github/trufflesuite/truffle/badge.svg)](https://coveralls.io/github/trufflesuite/truffle)

-----------------------


Truffle is a development environment, testing framework and asset pipeline for Ethereum, aiming to make life as an Ethereum developer easier. With Truffle, you get:

* Built-in smart contract compilation, linking, deployment and binary management.
* Automated contract testing with Mocha and Chai.
* Configurable build pipeline with support for custom build processes.
* Scriptable deployment & migrations framework.
* Network management for deploying to many public & private networks.
* Interactive console for direct contract communication.
* Instant rebuilding of assets during development.
* External script runner that executes scripts within a Truffle environment.

| ℹ️ **Contributors**: Please see the [Development](#development) section of this README. |
| --- |

### Install

```
$ npm install -g truffle
```

*Note: To avoid any strange permissions errors, we recommend using [nvm](https://github.com/nvm-sh/nvm).*

### Quick Usage

For a default set of contracts and tests, run the following within an empty project directory:

```
$ truffle init
```

From there, you can run `truffle compile`, `truffle migrate` and `truffle test` to compile your contracts, deploy those contracts to the network, and run their associated unit tests.

Truffle comes bundled with a local development blockchain server that launches automatically when you invoke the commands  above. If you'd like to [configure a more advanced development environment](https://trufflesuite.com/docs/advanced/configuration) we recommend you install the blockchain server separately by running `npm install -g ganache-cli` at the command line.

+  [ganache](https://github.com/trufflesuite/ganache): a command-line version of Truffle's blockchain server.
+  [ganache-ui](https://github.com/trufflesuite/ganache-ui): A GUI for the server that displays your transaction history and chain state.


### Documentation

Please see the [Official Truffle Documentation](https://trufflesuite.com/docs/) for guides, tips, and examples.

-----------------------

![MarineGEO circle logo](https://trufflesuite.github.io/ganache/assets/img/ganache-logo-dark.svg "MarineGEO logo")

[![npm](https://img.shields.io/npm/v/ganache.svg)](https://www.npmjs.com/package/truffle)
[![npm](https://img.shields.io/npm/dm/ganache.svg)](https://www.npmjs.com/package/truffle)


-----------------------
# A local blockchain for fast Ethereum development.

## Features

Ganache is an Ethereum simulator that makes developing Ethereum applications faster, easier, and safer. It includes all popular RPC functions and features (like events) and can be run deterministically to make development a breeze.

- Zero-config Mainnet Forking
- Fork any Ethereum network without waiting to sync
- Ethereum JSON-RPC support
- Snapshot/revert state
- Mine blocks instantly, on demand, or at an interval
- Fast-forward time
- Impersonate any account (no private keys required!)
- Listens for JSON-RPC 2.0 requests over HTTP/WebSockets
- Programmatic use in Node.js
- Pending Transactions

## Getting Started

Ganache can be used from the [command line](#command-line-use), [programmatically](#programmatic-use) via Node.js, or [in the browser](#browser-use).

### Command line use

You must first install [Node.js](https://nodejs.org/) >= v10.13.0 and npm >= 6.4.1.

To install Ganache globally, run:

```console
$ npm install ganache --global
```

In case you're upgrading from a previous version of Ganache, we've also written up [this handy guide](https://github.com/trufflesuite/ganache/blob/develop/UPGRADE-GUIDE.md) on how to upgrade/install Ganache and to document all breaking changes to look out for.

### License

MIT
