// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

contract Import {
    function fn (uint a,uint b) public pure {
        //uint max = Math.max(a,b);
        //console.log("max: ",max);
        uint max = Math.max(a,b);
        console.log("max: ",max);
    }
}