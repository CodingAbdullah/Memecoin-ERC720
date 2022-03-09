import React, { useState, useEffect } from "react";
import Memecoin from "./contracts/Memecoin.json";
import getWeb3 from "./getWeb3";

import "./App.css";

const App = () => {
  
  const [web3, updateWeb3] = useState(null);
  const [contract, updateContract] = useState(null);
  const [accounts, updateAccounts] = useState(null);
  const [address, updateAddress] = useState("");

  const fetchWeb3 = async () => {
    console.log("we are here");
    try {
      const web3 = await getWeb3();
      console.log(web3);
      updateWeb3(web3);
          
      const id = await web3.eth.net.getId();
      const network = Memecoin.networks[id];

      console.log(network);

      const contract = await new web3.eth.Contract(
        Memecoin.abi, network && network.address
      );
      
      updateContract(contract);

      const accountsList = await web3.eth.getAccounts();
      updateAccounts(accountsList);

      const contractAddress = contract.options.address;
      updateAddress(contractAddress);
      console.log(contract);
    }

    catch (err) {
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`,
      );  
      console.log(err);
    }
  } 
/*
  useEffect(() => {
    fetchWeb3();
  }, []);

  if (!web3) {
    return <div>Loading Web3, accounts, and contract...</div>;
  }
  else {
  */
    return (
      <div className="App">
        <h1>Good to Go!</h1>
        <h2>ERC 20 Contract Example</h2>
        <label>Memecoin contract deployed to: </label><b>{address}</b>
        { web3 ? 
            <div><br /><label>Connected to wallet: </label><p><b>{web3.currentProvider.selectedAddress}</b></p></div> : 
            <div><br /><button class="btn btn-success" onClick={fetchWeb3}>Connect Wallet</button></div> 
        }
      </div>
    );
  // }
}

export default App;