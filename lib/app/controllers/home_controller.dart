import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class HomeController {
  ValueNotifier<String> answer = ValueNotifier('0');
  ValueNotifier<bool> isCalculable = ValueNotifier(true);
  String currentNum = '0';

  bool isPercentable(){
    if (currentNum != '' && isNotOp(answer.value[answer.value.length - 1])) {
      return currentNum[0] != 'I';
    }
    return false;
  }

  getAnswer () {
    return answer.value;
  } 

  setAnswer (String v) {
    answer.value = v;
    currentNum = v;
  }

  void clear() {
    answer.value = '0';
    currentNum = '0';
    tryIsCalculable();
  }

  void addAlg (String n) {
    answer.value += n;
    currentNum += n;
    if(currentNum != '0' && currentNum[0] == '0' && currentNum[1] != '.') {
      answer.value = answer.value.substring(0, answer.value.length - currentNum.length) + currentNum.substring(1, currentNum.length);
      currentNum = currentNum.substring(1, currentNum.length);
    } 
    tryIsCalculable();
  }

  void addOp (String n) {
    if (isNotOp(answer.value[answer.value.length - 1])) {
      answer.value += n;
    } else {
      removeChar();
      answer.value += n;
    }
    currentNum = '';
    tryIsCalculable();
  }

  void addDot() {
    if (currentNum[0] != 'I') {
      answer.value += '.';
      currentNum += '.';
      tryIsCalculable();
    }
  }

  void addPerCent() {
    if (isPercentable()) {
      
      double aux = double.parse(currentNum)/100;    
      answer.value = answer.value.substring(0, answer.value.length - currentNum.length) + aux.toString();
      currentNum = aux.toString();
      
      tryIsCalculable();
    }
  }

  void removeChar() {
      if (answer.value.length == 1) {
        answer.value = '0';
        currentNum = '0';
      } else {
        answer.value = answer.value.substring(0, answer.value.length - 1);
        if (currentNum.length != 1) {
          currentNum = currentNum.substring(0, currentNum.length - 1);
        }
        if (isNotOp(answer.value[answer.value.length - 1])) {
          currentNum = answer.value;
        } 
      }
   
    tryIsCalculable();
  }

  String calcExpression () {
    String res = 'f';
    try {
      num ans = answer.value.interpret();
      res = ans.toString();
    } catch (e) {
      res = 'f';
    }
    return res;
  }

  void tryIsCalculable() {
    if (calcExpression() == 'f') {
      isCalculable.value = false;
    } else {
      isCalculable.value = true;
    }

  }

  
  bool isNotOp(String char){
    if (char != '+' && char != '-' && char != '*' && char != '/') {
      return true;
    } else {
      return false;
    }
  }

}