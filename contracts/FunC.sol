// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Func {
    
     struct Person {
        string name;
        uint8 age;
    }

    mapping(address => uint256) balances;
    bytes by ="123";

    string str = "123";
    Person guoguo = Person({name:"guoguo",age:25});
    Person[] persons;

    event LogString(string value);

    function fn() public {
        balances[0x1234567890123456789012345678901234567890] = 100;
        delete balances[0x1234567890123456789012345678901234567890];
        by.push("4");
        by.length; 
        by[0];
        by[1] = "1";
        string memory strBy = string(by);
         emit LogString(strBy);

        bytes memory byStr = bytes(str);
        delete byStr;
        guoguo.name;
        persons.push(Person({name:"guoguo",age:40}));
        persons.length;
        delete persons[0];
    }
}

