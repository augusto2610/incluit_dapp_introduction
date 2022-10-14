// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ArrayAndMaps {

    //Dynamic array
    Character[] public characters;
    //Fixed array
    uint[5] public fixedArray;

    //Map
    mapping(address => Character) addressToCharacter;

    struct Character {
        string name;
    }

    function addSenderWallet(string memory name) public {
        addressToCharacter[msg.sender] = Character(name);
    }

    function getValueSenderWallet() public view returns (Character memory) {
        return addressToCharacter[msg.sender];
    }

    function add(string memory name) public {
        characters.push(Character(name));
    }

    function getSize() public view returns (uint size) {
        return characters.length;
    }

    function deleteValue(uint position) public {
        delete characters[position];
    }

    function loopFixedArray() public {
        for(uint i = 0; i < 5; i++) {
            fixedArray[i] = i;
        }
    }

    function loopFixedArrayWhile() public {
        uint i = 0;
        while(i < 5) {
            if(i != 2) {
                fixedArray[i] = i;
            }
            i++;
        }
    }
}