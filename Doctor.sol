pragma solidity ^0.5.0;

contract Samp{
    struct Doctor{
        uint64 id;
        string Name;
        uint64 Phoneno;
    }
   // Person[] public people;
    mapping(address => Doctor)public people;
    function addDoctor(uint64 _id, string memory _Name, uint64 _Phoneno) public{
        people[msg.sender] = Doctor(_id,_Name,_Phoneno);
    }
}
