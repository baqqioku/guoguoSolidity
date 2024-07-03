// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ArrayRemoveByShifting {
    uint256[] public arr;

    event ElementRemoved(uint256 index, uint256 value);
    event ArrayState(uint256[] array);

    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound");
        emit ElementRemoved(_index, arr[_index]);
        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
        emit ArrayState(arr);  // 记录移除后的数组状态
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        emit ArrayState(arr);  // 记录初始数组状态
        remove(2);
        emit ArrayState(arr);  // 记录移除后的数组状态

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);  // 修正：移除索引2的值后，新的arr[2]应该是原来的arr[3]
        assert(arr[3] == 5);  // 新的arr[3]应该是原来的arr[4]
        assert(arr.length == 4);

        arr = [1];
        emit ArrayState(arr);  // 记录初始数组状态
        remove(0);
        emit ArrayState(arr);  // 记录移除后的数组状态
        assert(arr.length == 0);
    }
}
