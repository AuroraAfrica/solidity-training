//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./studentRecord.sol";

contract FactoryContract {
    StudentDatabase public studentRecordNewAdrr;

    //ABI
    //contract the address;

    function deploy() public {
        studentRecordNewAdrr = new StudentDatabase();
    }
}
