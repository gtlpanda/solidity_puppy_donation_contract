// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract puppyDonations {
    // charity addresses
    address payable[] public charityAddresses;
    uint256 highestDonation;
    uint256 sumDonations = 0;
    uint256 sumDonationAmount;
    address payable highestDoner;
    address payable owner;

    constructor(address payable[] memory addresses_) {
        owner = payable(msg.sender);
        charityAddresses = addresses_;
        sumDonationAmount = 0;
        highestDonation = 0;
    }

    /// Validates that the sender originated the transfer is different than the target destination. Destination address is
    modifier validateDestinationCheck(
        address payable destinationAddressTesting
    ) {
        require(
            msg.sender != destinationAddressTesting,
            "Sender and recipient cannot be the same."
        );
        _;
    }

    // validate that the amount to send is not zero
    // modifier validateDonation(uint256 donationAmount) {
    //     // checks if the amount to donate is larger than 0, donation amount is less than ether in wallet, and
    //     require(
    //         donationAmount > 0 &&
    //             donationAmount >
    //             address(0x847167cfCe5730d88A467a458f600ae99AEF6A78).balance, // this address is a hardhat generated contract for testing purposes
    //         "Donation amount needs to be higher than 0 AND less than the balance in your wallet."
    //     );
    //     _;
    // }
    // Validates that the charity index number provided is a valid one.
    //
    // @param charityIndex The target charity index to validate. Indexes start from 0 and increment by 1.
    modifier validateCharity(uint256 charityIndex) {
        require(
            charityIndex <= charityAddresses.length - 1,
            "Invalid charity index."
        );
        _;
    }

    //     /// Transmits the address of the donor and the amount donated.  Don't why I need this yet... but soon
    event Donation(address indexed _doner, uint256 _value);

    // donation function
    function donateToPuppies(
        address payable destinationAddress,
        uint256 donationAmount,
        uint256 charityIndex
    )
        public
        payable
        validateDestinationCheck(destinationAddress)
        validateCharity(charityIndex)
    {
        // I still need to map the index of addresses but basically when you select one of the addresses form the array, you transfer the amount there
        charityAddresses[charityIndex].transfer(donationAmount);

        // emitting an event, not sure why
        emit Donation(msg.sender, donationAmount);
        // adding donation amount to the overall total
        sumDonationAmount += donationAmount;
        //we need to fucking check that the donation amount was the highest and if it was, set it to new high score
        if (donationAmount > highestDonation) {
            highestDonation = donationAmount;
            highestDoner = payable(msg.sender);
        }
    }

    // Returns all the available charity addresses.
    // @return charityAddresses
    function getAddresses() public view returns (address payable[] memory) {
        return charityAddresses;
    }

    // Returns the total amount raised by all donations (in wei) towards any charity.
    // @return totalDonationsAmount
    function returnSumDonationAmount() public view returns (uint256) {
        return sumDonationAmount;
    }

    // Returns the address that made the highest donation, along with the amount donated.
    // @return (highestDonation, highestDonor)
    function getHighestDonation()
        public
        view
        returns (uint256, address payable)
    {
        return (highestDonation, highestDoner);
    }
}
