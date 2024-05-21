import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_quality/model/account_model.dart';

class AccountProvider extends ChangeNotifier{
  String userNameError='',passwordError='';
  bool hidePassword=true;
  List<String> lastAccount=[];
  
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
 
  CollectionReference updateUser = FirebaseFirestore.instance.collection('users'); 
  void addAccount(String user){
    AccountModel.currentUser=user;
    userNameError='';
    passwordError='';
    if(findAccount(user)){
      lastAccount.remove(user);
      update(user, false);
    }
    if(lastAccount.length<2){
      AccountModel.accountMap[user]!.lastVisit=true;
      lastAccount.add(user);
      update(user, true);
    }else{
      lastAccount[0]=lastAccount[1];
      lastAccount[1]=user;
    }
    notifyListeners();
  }
  update (String user,bool val)async {
    await updateUser.doc(AccountModel.userDocumentId[user]).update({'lastVisit':val});
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
  void emptyAll(){
    AccountModel.accountList.clear();
    AccountModel.accountMap.clear();
    lastAccount.clear();
  }
  //chamge name
}


/*
Provider.of<ControllProvider>(context). =>data
Provider.of<ControllProvider>(context,listen: false).  =>method
 */