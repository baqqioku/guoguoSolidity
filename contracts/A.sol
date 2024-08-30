
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract A {
    function sum(uint a,uint b) public pure returns (uint) {
        return a+b;
    }


}

contract B is A {
    function fn (uint c) public pure returns (uint) {
        uint res = super.sum(1+2,c);
        return res;
    }
}

interface C {
    function sum(uint a,uint b) external pure returns (uint);
}

contract D is C{
    function sum(uint a,uint b) public pure returns (uint) {
        return a+b;
    }
}

abstract contract E {
    function sum(uint a,uint b) public pure virtual returns (uint);
}

contract F is E {
    function sum(uint a, uint b)public override pure returns (uint){
        return a+b;
    }
}