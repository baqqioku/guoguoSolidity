
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Error {
    error myError(string name);
    function fn1() public pure {
        require(1>0,"Error massge");
    }

    function fn2() public pure {
        if(1<0){
            revert("Error message");
        }
    }

    function fn3() public pure {
        assert(1>0);
    }

    function fn4() public pure {
        if(1<0){
            revert myError("Error message");
        }
    }
}
