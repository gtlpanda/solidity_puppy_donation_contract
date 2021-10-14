// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

contract donations {
    // charity addresses
    address payable[] public charityAddress = [
        0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,
        0x70997970C51812dc3A010C7d01b50e0d17dc79C8
        // hardhat accounts to test with
    ];
    // highest donation
    uint256 highestDonation;
    // total donations
    uint256 sumDonatoins = 0;

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
    modifier validateDonationnAmountIsNotZero(uint256 donationAmount) {
        // checks if the amount to donate is larger than 0, donation amount is less than ether in wallet, and
        require(
            donationAmount > 0 ether &&
                donationAmount >
                address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266).balance,
            "Donation amount needs to be higher than 0 AND less than the balance in your wallet."
        );
        _;
    }

    // donation function
    //
}
