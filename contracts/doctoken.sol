//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DOC is ERC20 {
    uint public constant maxTotalSupply = 100000 *10 ** 18;

    constructor() ERC20("DOC-TOKEN", "DOC") {}
     
     function mint (uint _amount) internal{
            _mint  (msg.sender, (_amount*10**18));
    }
}
