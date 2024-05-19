import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_quality/model/account_model.dart';
class SettingProvider extends ChangeNotifier{
  String fristNameHint=AccountModel.accountMap[AccountModel.currentUser]!.firstName;
  String lastNameHint=AccountModel.accountMap[AccountModel.currentUser]!.lastName;
  String passwordHint=AccountModel.accountMap[AccountModel.currentUser]!.password;
  String emailHint=AccountModel.accountMap[AccountModel.currentUser]!.email;
  String addressHint=AccountModel.accountMap[AccountModel.currentUser]!.address;
  String contactHint=AccountModel.accountMap[AccountModel.currentUser]!.contactNumber;
  String cityHint=AccountModel.accountMap[AccountModel.currentUser]!.city;
  String stateHint=AccountModel.accountMap[AccountModel.currentUser]!.state;

  void changeFirstName(String firstName){
    AccountModel.accountMap[AccountModel.currentUser]!.firstName=firstName;
    fristNameHint=firstName;
    
    notifyListeners();
  }
  void changeLastName(String lastName){
    AccountModel.accountMap[AccountModel.currentUser]!.lastName=lastName;
    lastNameHint=lastName;
    notifyListeners();
  }
  void changePassword(String password){
    AccountModel.accountMap[AccountModel.currentUser]!.password=password;
    passwordHint=password;
    notifyListeners();
  }
  void changeAddress(String address){
    AccountModel.accountMap[AccountModel.currentUser]!.address=address;
    addressHint=address;
    notifyListeners();
  }
  void changeContactNumber(String contactNumber){
    AccountModel.accountMap[AccountModel.currentUser]!.contactNumber=contactNumber;
    contactHint=contactNumber;
    notifyListeners();
  }
  void changeCity(String city){
    AccountModel.accountMap[AccountModel.currentUser]!.city=city;
    cityHint=city;
    notifyListeners();
  }
  void changeState(String state){
    AccountModel.accountMap[AccountModel.currentUser]!.state=state;
    stateHint=state;
    notifyListeners();
  }
}