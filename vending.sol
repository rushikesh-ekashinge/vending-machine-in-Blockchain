//SPDX-License-Identifier:MIT
pragma solidity >=0.5.0 < 0.9.0;
contract vendingMachine{
    //address is size of 20 bit
    address public owner;
     mapping(address=>uint)public donutBalances;
    constructor(){
              owner=msg.sender;
              donutBalances[address(this)]=100;//100 is inital value

          }
          function  vendingMachineBalance() public view returns (uint) {
              return donutBalances[address(this)];
          }
          function restock(uint amount)public{
              require(msg.sender==owner,"only the owner will be restock the machine");
              donutBalances[address(this)]+=amount;
          }
          function purchase(uint amount)public payable{
              require(msg.value>= amount* 2 ether,"you must pay at least 2 ether for donut");
              require(donutBalances[address(this)]>=amount,"not enough donut stock is fullfill purchase request");
               donutBalances[address(this)]-=amount;
               donutBalances[msg.sender]+=amount;
          }
}
