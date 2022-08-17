//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./sittoken.sol";
import "./doctoken.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Swapping is SIT{
    address sender1;
    address sender2;
    ERC20 public token1;
    ERC20 public token2;
    uint amountrequest;
    uint amount; 

    constructor ( address _sender1, address 
    _token1, address _sender2, address _token2){
        sender1 = _sender1;
        sender2 = _sender2;
        token1 = ERC20(_token1);
        token2 = ERC20(_token2);
    }


    
    function swap(uint _amount, uint _askingtoken) public{
        require(msg.sender == sender1 || msg.sender == sender2, "Not an approved owner");
        require(token1.allowance(sender1, address(this)) >= _amount, "Allowed amount is too low");
        require(token2.allowance(sender2, address(this)) >= _askingtoken, "Allowed amount too low");
        _TransferFrom(token1, sender1, sender2, amountrequest);
        _TransferFrom(token2, sender2, sender1, amount);
    }


     function _TransferFrom(ERC20 token, address sender, address recipient, uint transferringamount) private {
        bool sent = token.transferFrom(sender, recipient, transferringamount);
        require(sent, "Transfer unsuccessful");
    }
}



// function totalSupply() external view returns (uint);

//     function balanceOf(address account) external view returns (uint);

//     function transfer(address recipient, uint amount) external returns (bool);

//     function allowance(address owner, address spender) external view returns (uint);

//     function approve(address spender, uint amount) external returns (bool);

//     function transferFrom(
//         address sender,
//         address recipient,
//         uint amount
//     ) external returns (bool);

//     event Transfer(address indexed from, address indexed to, uint value);
//     event Approval(address indexed owner, address indexed spender, uint value);
// }