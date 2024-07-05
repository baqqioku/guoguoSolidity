
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TestTransientStorage {
    bytes32 constant SLOT =0;
    function test() public {
        assembly {
            //tstore(SLOT, 321)
        }
        bytes memory b = "";
        (bool success, ) = msg.sender.call(b);
        require(success, "Call failed");
        // Clear transient storage
        assembly {
            //tstore(SLOT, 0)
        }
    }

    

    
}

//https://github.com/cosmology-tech/cosmos-kit