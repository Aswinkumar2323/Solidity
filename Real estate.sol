// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract RealEstateMarket {
    struct Property {
        address owner;
        uint price;
        bool isSold;
    }

    mapping(uint => Property) public properties;
    uint public propertyCount;

    event PropertyAdded(uint indexed id, uint price);
    event PropertySold(uint indexed id, address indexed buyer);

    function addProperty(uint _price) public {
        propertyCount++;
        properties[propertyCount] = Property(msg.sender, _price, false);
        emit PropertyAdded(propertyCount, _price);
    }

    function buyProperty(uint _id) public payable {
        require(_id <= propertyCount && _id > 0, "Invalid property ID");
        Property storage property = properties[_id];
        require(!property.isSold, "Property is already sold");
        require(msg.value >= property.price, "Insufficient funds");
        
        address payable seller = payable(property.owner);
        seller.transfer(msg.value);
        property.isSold = true;
        emit PropertySold(_id, msg.sender);
    }
}
