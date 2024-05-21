import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/model/notification_model.dart';
class NotificationProvider extends ChangeNotifier{
  //notification


  void offNotification(String user){
    AccountModel.accountMap[user]!.haveNotification=false;
    notifyListeners();
  }

  void addNotification(int user,NotificationModel notify ){
    AccountModel.accountMap[AccountModel.accountList[user]]!.haveNotification=true;
    NotificationData.notificationLast[user]!.add(notify);
    notifyListeners();
  }

  void readNotification(int user,int ind ){
    NotificationData.notificationLast[user]![ind].read=true;
    notifyListeners();
  }

  void deleteNotification(int user,int ind){
    NotificationData.notificationLast[user]!.removeAt(ind);
    notifyListeners();
  }
  void empty(){
    for(int i=0;i<AccountModel.accountList.length;i++){
      NotificationData.notificationLast[i]!.clear();
    }
    notifyListeners();
  }

  int lengthDataNotification(int user){
    return NotificationData.notificationLast[user]!.length;
  }
  bool? isHaveNew(String user){
    return AccountModel.accountMap[user]!.haveNotification;

  }
}