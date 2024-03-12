// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RideSharing {
    struct Ride {
        address driver;
        uint256 startTime;
        uint256 endTime;
        uint256 fare;
    }
    
    mapping(address => Ride[]) public rides;
    
    event NewRide(address indexed driver, uint256 startTime, uint256 endTime, uint256 fare);
    
    function createRide(uint256 _startTime, uint256 _endTime, uint256 _fare) public {
        require(_startTime < _endTime, "Invalid ride duration");
        
        Ride memory newRide = Ride({
            driver: msg.sender,
            startTime: _startTime,
            endTime: _endTime,
            fare: _fare
        });
        
        rides[msg.sender].push(newRide);
        
        emit NewRide(msg.sender, _startTime, _endTime, _fare);
    }
    
    function getRides(address _driver) public view returns (Ride[] memory) {
        return rides[_driver];
    }
}
