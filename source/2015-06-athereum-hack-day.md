---
title: attended Blockchain Hack Day
date: 2015/06/26
tags: [events]
author: Jez Nicholson
alias: /
time-spent: 1d
---
On Friday I attended a hack day with the very nice people at Bright Minded in Hove.

We had a general introduction to blockchain and tried to get our heads round it.

I did an install

    go get github.com/ethereum/go-ethereum

changed directory to that directory, which is a git repo

    git checkout tags/v0.9.32
    brew install gmp
    make geth

    ./geth --networkid 8454 --datadir ~/development/ethereum/ console 2>>~/geth.log

    modules: admin:1.0 db:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 shh:1.0 txpool:1.0 web3:1.0
...are all the objects you can relate to

they are javascript-like objects so can be examined

    admin
    {
      chainSyncStatus: {
        blocksAvailable: 0,
        blocksWaitingForImport: 0,
        estimate: '0',
        importing: 0
      },
      datadir: '/Users/jeznicholson/development/ethereum',
      nodeInfo: {
        DiscPort: 30303,
        IP: '::',
        ListenAddr: '[::]:30303',
        Name: 'Geth/v0.9.32-72e2613a/darwin/go1.4',
        NodeID: '9d8fd63b27e187ddbf205f5a4657a856bc98e28859119fa2fe37450c6b64aa9ec5cdac3bdc3231b2edff7587278c5079181dc38c9545b9933c01feda110a9cf7',
        NodeUrl: 'enode://9d8fd63b27e187ddbf205f5a4657a856bc98e28859119fa2fe37450c6b64aa9ec5cdac3bdc3231b2edff7587278c5079181dc38c9545b9933c01feda110a9cf7@[::]:30303',
        TCPPort: 30303,
        Td: '131072'
      },
      peers: Error: ,
      addPeer: function (),
      exportChain: function (),
      getChainSyncStatus: function (),
      getDatadir: function (),
      getNodeInfo: function (),
      getPeers: function (),
      importChain: function (),
      setSolc: function (),
      startRPC: function (),
      stopRPC: function (),
      verbosity: function ()
    }
    > personal
    {
      listAccounts: [ ],
      getListAccounts: function (),
      newAccount: function (),
      unlockAccount: function ()
    }



    > personal.newAccount('changeme')
    '0x19a290998213a98e21820dc8aaf2cdf91248019b'
    > personal.listAccounts
    ['0x19a290998213a98e21820dc8aaf2cdf91248019b' ]



on first mining operation it creates the direct acyclic graph (DAG)

    miner.start()
    true

    I0626 12:17:51.450205   91056 ethash.go:192] Generating DAG for epoch 0 (0000000000000000000000000000000000000000000000000000000000000000)
    I0626 12:17:51.456824   91056 backend.go:588] checking DAG (ethash dir: /Users/jeznicholson/.ethash)
    I0626 12:17:52.921007   91056 ethash.go:220] Still generating DAG: 0%
    I0626 12:17:58.853706   91056 ethash.go:220] Still generating DAG: 1%
    I0626 12:18:04.591292   91056 ethash.go:220] Still generating DAG: 2%
    I0626 12:18:10.329969   91056 ethash.go:220] Still generating DAG: 3%
    I0626 12:18:16.091094   91056 ethash.go:220] Still generating DAG: 4%
    I0626 12:18:21.813244   91056 ethash.go:220] Still generating DAG: 5%
.....

this takes a while....

    I0626 12:27:41.830801   91056 ethash.go:209] Done generating DAG for epoch 0, it took 9m50.380632239s
    I0626 12:28:14.391098   91056 chain_manager.go:700] imported 1 block(s) (0 queued 0 ignored) including 0 txs in 1.62743908s. #1 [2ef06f38 / 2ef06f38]
    I0626 12:28:14.391462   91056 worker.go:257] 🔨  Mined block (#1 / 2ef06f38). Wait 5 blocks for confirmation
    I0626 12:28:14.420487   91056 worker.go:415] commit new work on block 2 with 0 txs & 0 uncles. Took 24.225227ms


to find out how quickly you are mining, find the hashrate and how difficult it was

    miner.hashrate
    98051
    eth.getBlock('latest').difficulty / miner.hashrate
    3.456579300817376

to get the balance

    eth.getBalance(eth.accounts[0])
    '215437500000000000000'
    web3.fromWei(eth.accounts[0],"ether")
    '146350086398035993514202957176.321948109911884187'

    var name = "jez"
    undefined
    eth.namereg.addr(name)
    '0x'

    var sender = eth.accounts[0]
    eth.sendTransaction({from: sender, to: receiver, value: amount})


https://chriseth.github.io/cpp-ethereum/

    contract jtoken {
      mapping (address => uint) public balances;
      address public admin;
      uint tax;
      
      function jtoken()
      {
        balances[msg.sender] = 1000;
        admin = msg.sender;
        tax = 1;
      }
      
      function sendToken(address receiver, uint amount)
      {
        if(balances[msg.sender] < amount + tax) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        balances[admin] += tax;
      }
      
      function setTax(uint value)
      {
          if (msg.sender == admin) return;
          tax = value;
      }
      
      function getBalance() returns (uint)
      {
          return balances[msg.sender];
      }
      
      function kill() {
        if (msg.sender == admin) {
          suicide(admin);
        }
      }
    }


var jtoken = eth.sendTransaction({data: '0x60606040525b6103e8600060005060003373ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000508190555033600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff0219169083021790555060016002600050819055505b6103cb806100816000396000f30060606040523615610074576000357c01000000000000000000000000000000000000000000000000000000009004806312065fe01461007657806327e235e3146100975780632e5bb6ff146100be578063412664ae146100d157806341c0e1b5146100ea578063f851a440146100f757610074565b005b6100816004506102fb565b6040518082815260200191505060405180910390f35b6100a8600480359060200150610154565b6040518082815260200191505060405180910390f35b6100cf600480359060200150610292565b005b6100e860048035906020018035906020015061016f565b005b6100f5600450610337565b005b61010260045061012e565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60006000506020528060005260406000206000915090505481565b6002600050548101600060005060003373ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000505410156101b25761028e565b80600060005060003373ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008282825054039250508190555080600060005060008473ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008282825054019250508190555060026000505460006000506000600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828282505401925050819055505b5050565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614156102ed576102f8565b806002600050819055505b50565b6000600060005060003373ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600050549050610334565b90565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614156103c857600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16ff5b5b56', from: eth.accounts[0], gas: 1000000, gasPrice: web3.toWei(0.001, "finney")})
eth.getCode(jtoken)


var address = '0x5b3ac9cd817a30f3e614a313f044e461697a718f';
var abi = [{"constant":false,"inputs":[],"name":"checkGoalReached","outputs":[{"name":"response","type":"bytes32"}],"type":"function"},{"constant":true,"inputs":[],"name":"deadline","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[],"name":"beneficiary","outputs":[{"name":"","type":"address"}],"type":"function"},{"constant":false,"inputs":[{"name":"_beneficiary","type":"address"},{"name":"_fundingGoal","type":"uint256"},{"name":"_duration","type":"uint256"},{"name":"_price","type":"uint256"},{"name":"_reward","type":"address"}],"name":"setup","outputs":[{"name":"response","type":"bytes32"}],"type":"function"},{"constant":true,"inputs":[],"name":"tokenReward","outputs":[{"name":"","type":"address"}],"type":"function"},{"constant":true,"inputs":[],"name":"fundingGoal","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[],"name":"amountRaised","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[],"name":"price","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[],"name":"numFunders","outputs":[{"name":"","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"funders","outputs":[{"name":"addr","type":"address"},{"name":"amount","type":"uint256"}],"type":"function"},{"constant":true,"inputs":[],"name":"admin","outputs":[{"name":"","type":"address"}],"type":"function"},{"inputs":[],"type":"constructor"}];
var instance = eth.contract(abi).at(address)



