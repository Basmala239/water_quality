// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/controller/provider/report_provider.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/model/notification_model.dart';
import 'package:water_quality/model/repost_model.dart';
import 'package:water_quality/screen/colors.dart';
import '../../controller/provider/notification_provider.dart';
import '../size_config.dart';
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final String user =AccountModel.currentUser;
  final noteDescription = TextEditingController();
  
  Future<void> addNotificationToDB(String toUser,String type,String description)async{
    CollectionReference collectionReference= FirebaseFirestore.instance.collection('notification');
     return collectionReference.add({
                          'ind':AccountModel.accountMap[toUser]!.ind,
                          'imagePath':AccountModel.accountMap[user]!.image,
                          'name': "${AccountModel.accountMap[user]!.firstName} ${AccountModel.accountMap[user]!.lastName}",
                          'time':'${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} \n ${DateTime.now().hour}:${DateTime.now().minute} ',
                          'description':description,
                          'read': false,
                          'type':type
                        })
                        .then((value) => print("recentExperiment Added"))
                        .catchError((error) => print("Failed to add user: $error"));
 }

 List <QueryDocumentSnapshot>data=[];
 addToList(){
    Provider.of<ReportProvider>(context,listen: false).empty();
    for(int i=0;i<data.length;i++){
        ExperimentReoprt ex=ExperimentReoprt(data[i]['name'], data[i]['duration'], data[i]['inf'], data[i]['eff']);
        Provider.of<ReportProvider>(context,listen: false).addExperimentToReport(ex);
    }
  }
  getReportExperiment()async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('reportExperiment').get();
    data.addAll(querySnapshot.docs);
    addToList();
  }

  @override
  void initState() {
    getReportExperiment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child:
         Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Daily Report',
              style: TextStyle(
                fontFamily: AssetsManager.font,
                color: MyColor.black,
                fontWeight: FontWeight.w600,
                fontSize: 64*SizeConfig.horizontalBlock
              ),),
            const  SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 128*SizeConfig.verticalBlock,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColor.blueB3,
                      boxShadow: [
                        BoxShadow(
                          color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:const Offset(4,4),
                        )
                ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(

                        children: [
                        Container(
                        width: 50,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipOval(
                        child: SizedBox.fromSize(
                          size:  const Size.fromRadius(100), // Image radius
                          child: Image.asset(AccountModel.accountMap[user]!.image, fit: BoxFit.cover),
                        ),
                      ),
                      ),
                      const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AccountModel.accountMap[user]!.jobTitle,
                            style:const  TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: MyColor.white
                            ),),
                            Text("${AccountModel.accountMap[user]!.firstName} ${AccountModel.accountMap[user]!.lastName}",style:const  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MyColor.white
                            ),),
                          ],
                        )
                      ]),
                    ),
                  ),
                
                const SizedBox(width: 15,),
                 Container(
                     width: 240,
                    height: 128*SizeConfig.verticalBlock,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColor.blueB3,
                      boxShadow: [
                        BoxShadow(
                          color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:const Offset(4,4),
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColor.gray9D
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyColor.black,
                            ),
                            child: const Text('%',style: TextStyle(color: MyColor.white),),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Efficiency',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: MyColor.white
                            ),),
                            Text("${Provider.of<ReportProvider>(context).efficiencyres()} %",style:  TextStyle(
                              fontSize: 20*SizeConfig.horizontalBlock,
                              fontWeight: FontWeight.w600,
                              color: MyColor.white
                            ),),
                          ],
                        )
                      ]),
                    ),
                  ),
                
              ],
            ),
            const  SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Flow',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const  SizedBox(height: 5,),
                    Container(
                      width: 250*SizeConfig.horizontalBlock,
                      height: 60,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset:const Offset(4,4),
                          )
                        ]
                      ),
                      child: const Text('m³/day  '),
                    )
                  ],
                ),Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('R.Cl₂',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),const  SizedBox(height: 5,),
                    Container(
                     width: 250*SizeConfig.horizontalBlock,
                      height: 60,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset:const Offset(4,4),
                          )
                        ]
                      ),
                      child: const Text('mg/l  '),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Duration',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const  SizedBox(height: 5,),
                    Container(
                      width: 250*SizeConfig.horizontalBlock,
                      height: 60,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset:const Offset(4,4),
                          )
                        ]
                      ),
                      child:Text('${Provider.of<ReportProvider>(context).totleDurationRes()}  '),
                    )
                  ],
                ),
              ],
            ),
            const  SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const  SizedBox(height: 5,),
                    Container(
                       width: 250*SizeConfig.horizontalBlock,
                      height: 60,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset:const Offset(4, 4),
                          )
                        ]
                      ),
                      child: const Text('2024-5-20  '),
                    )
                  ],
                ),Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Day',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const  SizedBox(height: 5,),
                    Container(
                       width: 250*SizeConfig.horizontalBlock,
                      height: 60,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset:const Offset(4,4),
                          )
                        ]
                      ),
                      child: const Text('Monday  '),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temp',
                    style: TextStyle(
                      fontSize: 26*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),),
                    const  SizedBox(height: 5,),
                    Container(
                      width: 250*SizeConfig.horizontalBlock,
                      height: 60,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset:const Offset(4,4),
                          )
                        ]
                      ),
                      child: const Text('m³/day  '),
                    )
                  ],
                ),
              ],
            ),
            const  SizedBox(height: 15,),
            Container(
              width: 1080*SizeConfig.horizontalBlock,
              height: 390*SizeConfig.verticalBlock,
              decoration: BoxDecoration(
                color: MyColor.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color:const Color.fromARGB(232, 159, 159, 159).withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset:const Offset(4,4),
                  )
                ]
              ),
              child:Column(children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Test Name',
                      style: TextStyle(
                        fontSize: 30*SizeConfig.horizontalBlock,
                        fontWeight: FontWeight.w500,
                        color: MyColor.black,
                      ),),
                      Text('Test Duration',
                      style: TextStyle(
                        fontSize: 30*SizeConfig.horizontalBlock,
                        fontWeight: FontWeight.w500,
                        color: MyColor.black,
                      ),),
                      Text('Inf',
                      style: TextStyle(
                        fontSize: 30*SizeConfig.horizontalBlock,
                        fontWeight: FontWeight.w500,
                        color: MyColor.black,
                      ),),
                      Text('Eff',
                      style: TextStyle(
                        fontSize: 30*SizeConfig.horizontalBlock,
                        fontWeight: FontWeight.w500,
                        color: MyColor.black,
                      ),)
                    ],
                    
                  ),
                ),
                SizedBox(
                  width: 1050*SizeConfig.horizontalBlock,
                 height: 300*SizeConfig.verticalBlock,
                  child: ListView.builder(
                    itemCount: Provider.of<ReportProvider>(context).lengthofExperimentReoprt(),
                    itemBuilder:(context, index){

                      return Row(
                      children: [
                        const SizedBox(width: 40,),
                        Text('  ${ReportModel.reportModelList[index].name}'),
                        const SizedBox(width: 250,),
                        Text('  ${ReportModel.reportModelList[index].duration}'),
                        const SizedBox(width: 230,),
                        Text('  ${ReportModel.reportModelList[index].inf}'),
                        const SizedBox(width: 150,),
                        Text('  ${ReportModel.reportModelList[index].eff}'),
                      ],
                    );}
                     
                  ),
                )
              ],)
        
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if(AccountModel.accountMap[user]!.jobTitle=='Engineer')
                Container(
                  width:150 ,
                  height: 40,
                  decoration: BoxDecoration(
                          border: Border.all(color: MyColor.blueB3,width:2),
                          borderRadius: BorderRadius.circular(50)
                        ),
                  child: ElevatedButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        
                        title: const Text('Add Review'),
                        content: Column(children: [
                          Material(  
                            
                            child:
                         SizedBox(
                          width: 500,
                          height: 500,
                           child: TextField(
                             keyboardType: TextInputType.multiline,
                             decoration:const InputDecoration(
                                border: InputBorder.none,
                              ),
                             maxLines: null,
                            controller: noteDescription,
                                                   
                        ),
                         ),
                      ),
                      const SizedBox(height: 15,),
                      ElevatedButton(onPressed: (){
                       
                        for(int i=0;i<AccountModel.accountMap.length;i++){
                        String sendTo=AccountModel.accountList[i];
                        if(AccountModel.accountMap[sendTo]!.jobTitle=='Chemist'||AccountModel.accountMap[sendTo]!.jobTitle=='Lab Technicion'){
                          addNotificationToDB(sendTo, 'Note', noteDescription.text);
                          Provider.of<NotificationProvider>(context,listen: false).addNotification(AccountModel.accountMap[sendTo]!.ind,
                            NotificationModel(
                              AccountModel.accountMap[sendTo]!.ind,
                             AccountModel.accountMap[user]!.image
                            , "${AccountModel.accountMap[user]!.firstName} ${AccountModel.accountMap[user]!.lastName}",
                             '1 min',
                              noteDescription.text,
                               false, 'Note')
                            );
                        }}
                       
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(MyColor.blueB3)
                      ),
                      child: const Text('Send',
                      style: TextStyle(
                        color: MyColor.white
                      ),),
                       )]),
                        
                      );
                    });
                  }, 
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(MyColor.white)
                    ),
                   child: Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColor.blueB3),
                          borderRadius: BorderRadius.circular(50)
                  
                        ),
                        child: const Text('+',
                        style: TextStyle(
                          color: MyColor.blueB3
                        ),),
                      ),
                      const Text(' Add Notes',
                        style: TextStyle(
                          color: MyColor.blueB3
                        ),),
                    ],
                   )),
                ),
                if(AccountModel.accountMap[user]!.jobTitle!='IT Depertment')
                SizedBox(
                  width:150 ,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){
                      for(int i=0;i<AccountModel.accountMap.length;i++){
                        String sendTo=AccountModel.accountList[i];
                        if(sendTo!=user&&AccountModel.accountMap[sendTo]!.jobTitle != 'IT Depertment'){
                          
                          addNotificationToDB(sendTo, 'Report', 'New Report');
                          Provider.of<NotificationProvider>(context,listen: false).addNotification(AccountModel.accountMap[sendTo]!.ind,
                            NotificationModel(
                            AccountModel.accountMap[sendTo]!.ind,
                            AccountModel.accountMap[user]!.image
                            , "${AccountModel.accountMap[user]!.firstName} ${AccountModel.accountMap[user]!.lastName}",
                             '1 min',
                              'New Report',
                               false, 'Report')
                            );
                       }
                       
                  }}, 
                  style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(MyColor.blueB3)
                      ),
                  child: const Text('Save',
                  style: TextStyle(
                    color: MyColor.white
                  ),)),
                )
              ],
            )
          ],
        
        )
      ),
      ));
  }
}