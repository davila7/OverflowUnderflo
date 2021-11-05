// SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
import "./SafeMath.sol";

contract OverflowUnderflow{
    
    using SafeMath for uint256;
    
    uint256 monto_minimo = 0;
    uint256 monto_maximo = 2**256-1;
    
    function errorUnderflow(uint restaMonto) public returns(uint){
        monto_minimo -= restaMonto;
        return monto_minimo;
    }
    
    function errorOverflow(uint sumaMonto) public returns(uint){
        monto_maximo += sumaMonto;
        return monto_maximo;
    }
    
    function prevenirUnderflow(uint restaMonto) public returns(uint256){
        require(monto_minimo > restaMonto, "Error");
        monto_minimo -= restaMonto;
        return monto_minimo;
    }
    
    function prevenirOverflow(uint sumaMonto) public returns(uint256){
          require(monto_maximo + sumaMonto > monto_maximo, "Error");
          monto_maximo += sumaMonto;
          return monto_maximo;
    
    }
    
    //Underflow con SafeMath
    function prevenirUnderflowSafeMath(uint restaMonto) public returns(uint256){
          monto_minimo = monto_minimo.sub(restaMonto);
          return monto_minimo;
    }
    
    //Overflow con SafeMath
    function prevenirOverflowSafeMath(uint sumaMonto) public returns(uint256){
         monto_maximo = monto_maximo.add(sumaMonto);
         return monto_maximo;
    }
    
}

