import { useContractReader } from "eth-hooks";
import { ethers } from "ethers";
import React from "react";
import { useEffect } from "react";
import { Link } from "react-router-dom";

/**
 * web3 props can be passed from '../App.jsx' into your local view component for use
 * @param {*} yourLocalBalance balance on current network
 * @param {*} readContracts contracts from current chain already pre-loaded using ethers contract module. More here https://docs.ethers.io/v5/api/contract/contract/
 * @returns react component
 **/
function Home({ yourLocalBalance, readContracts, tx }) {
  // you can also use hooks locally in your component of choice
  // in this case, let's keep track of 'purpose' variable from our contract
  console.log(readContracts)
  // useEffect(() => {
  //   readContracts.createToken && readContracts?.createToken()
  // },[readContracts])
  return (
    <div>
      <div style={{ margin: 32 }}>
        <button onClick={() => tx(readContracts.NFTContract.createToken())}>Mint NFT</button>
      </div>
    </div>
  );
}

export default Home;
