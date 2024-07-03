// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DataLocation {

    mapping (address => uint[]) public d;

    function fn(uint[] calldata a,uint[] memory b) public view returns (uint) {
        b[b.length-1]*=2;
        uint sum =0;

        uint[] storage c = d[msg.sender];
        for(uint i=0;i<a.length;i++){
            for(uint j=0;j<a.length;j++){
                for(uint k=0;k<b.length;k++){
                    uint currentSum =a[i] *b[j] * c[k];
                    sum += currentSum;
                }
            }
        }
        return sum;
    }

}