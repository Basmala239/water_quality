import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_quality/model/account_model.dart';

class AccountProvider extends ChangeNotifier{
  String userNameError='',passwordError='';
  bool hidePassword=true;
  List<String> lastAccount=['ahmed1@gmail.com'];
  
  void errorUserName(){
    userNameError='Unvalid User Name';
    passwordError='';
    notifyListeners();
  }
  void errorPassword(){
    userNameError='';
    passwordError='Unvalid Password';
    notifyListeners();
  }
  void showPassword(){
    hidePassword=!hidePassword;
    notifyListeners();
  }
 
  void addAccount(String user){
    AccountModel.currentUser=user;
    userNameError='';
    passwordError='';
    if(findAccount(user)){
      lastAccount.remove(user);
    }
    if(lastAccount.length<2){
      lastAccount.add(user);
    }else{
      lastAccount[0]=lastAccount[1];
      lastAccount[1]=user;
    }
    notifyListeners();
  }
  void deleteAccount(String user){
    lastAccount.remove(user);
    notifyListeners();  
  }

  bool findAccount(String user){
    for(String l in lastAccount){
      if(l==user){
        return true;
      }
    }
    return false;
  }

  bool empty(){
    return lastAccount.isEmpty;
  }
  //chamge name
}


/*
Provider.of<ControllProvider>(context). =>data
Provider.of<ControllProvider>(context,listen: false).  =>method
 */