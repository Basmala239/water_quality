import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/model/notification_model.dart';
import 'package:water_quality/screen/pages/report_screen.dart';
import 'package:water_quality/screen/pages/show_note.dart';
import 'package:water_quality/screen/widget/notification_widget.dart';
import '../../controller/provider/notification_provider.dart';
import '../../model/account_model.dart';
class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key});
  final NotificationData notify=NotificationData();
  final String user=AccountModel.currentUser;
  final int userInd=AccountModel.accountMap[AccountModel.currentUser]!.ind;
  @override
  Widget build(BuildContext context) {

   final int listLength=Provider.of<NotificationProvider>(context).lengthDataNotification(userInd);
    return Scaffold(
      body: Column(children: 
      [
        Row(
          children: [
            IconButton(
              onPressed: (){
                Provider.of<NotificationProvider>(context,listen: false).offNotification(user);
                Navigator.pop(context);
              }
              ,icon:const Icon(Icons.arrow_back)),
              const SizedBox(width: 10,),
              const Text('Notification',style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 55,
          color: Colors.black
        ),),
          ],
        ),
        
        SizedBox(
          width: double.infinity,
          height: 500,
          child: ListView.separated(
            itemCount: Provider.of<NotificationProvider>(context).lengthDataNotification(userInd),
            itemBuilder:(context, index)=>notificationWidget(
              NotificationData.notificationLast[userInd]![listLength-index-1]
              ,() {
                Provider.of<NotificationProvider>(context,listen: false).deleteNotification(userInd,listLength-index-1);
              }
              , (){
               Provider.of<NotificationProvider>(context,listen: false).readNotification(userInd, listLength-1-index);
                if(NotificationData.notificationLast[userInd]![listLength-1-index].type=='Report'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportScreen()));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteScreen(NotificationData.notificationLast[userInd]![listLength-1-index])));
                }
              }
              ), separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 3,); },
          ),
        )
      ]),
    );
  }
}