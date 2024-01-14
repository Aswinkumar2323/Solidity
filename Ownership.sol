pragma solidity ^0.5.0;

contract Ownership{
    address public owner;


    constructor()public{
    owner = msg.sender;
 }

 function getOwner() external view returns (address) {
    require(msg.sender == owner,"it is not owner ");
    
        return owner;
    }
}
