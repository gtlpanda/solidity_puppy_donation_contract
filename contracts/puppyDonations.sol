// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

contract donations {
    // charity addresses
    address payable[] public charityAddress = [
        0x847167cfCe5730d88A467a458f600ae99AEF6A78 // rinkeby address for testing :)
    ];
    // highest donation
    uint256 highestDonation;
    // total donations
    uint256 sumDonatoins = 0;
}
