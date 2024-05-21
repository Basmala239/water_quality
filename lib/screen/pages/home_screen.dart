import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/model/task_model.dart';
import 'package:water_quality/screen/colors.dart';
import 'package:water_quality/screen/pages/notification_screen.dart';
import 'package:water_quality/screen/size_config.dart';
import 'package:water_quality/screen/widget/experiment_widget.dart';
import 'package:water_quality/screen/widget/graph_widget.dart';
import 'package:water_quality/screen/widget/task_widget.dart';
import '../../controller/provider/experiment_provide.dart';
import '../../controller/provider/notification_provider.dart';
import '../../model/account_model.dart';
class HomeScreen extends StatefulWidget {
  const  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  final List<ChartData> chartData = [
            ChartData('David', 20),
            ChartData('Steve', 80),
        ];
  final String user=AccountModel.currentUser;

  List <QueryDocumentSnapshot>data=[];
  addToList(){
    Provider.of<RecentExperimentProvider>(context,listen: false).empty();
    for(int i=0;i<data.length;i++){
      RecentExperiment re=RecentExperiment(data[i]['name'], data[i]['by'], data[i]['time'], data[i]['date']);
      Provider.of<RecentExperimentProvider>(context,listen: false).addNewRecentExperiment(re);
    }
  }
  getExperimentType()async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('recentExperiment').get();
    data.addAll(querySnapshot.docs);
    addToList();
  }
  @override
  void initState() {
    super.initState();
    getExperimentType();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> const NotificationScreen()));
          }, icon:Stack(children: [const Icon(Icons.notifications_none),
          if(Provider.of<NotificationProvider>(context).isHaveNew(user)==true)
            Positioned(
              top: 1,
              right: 3,
              child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50)
              ),
            ))
          
          ],)),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: MyColor.gray9D,width: 3),
              borderRadius: BorderRadius.circular(50)
            ),
            child: ClipOval(
            child: SizedBox.fromSize(
              size:  const Size.fromRadius(100), // Image radius
              child: Image.asset(AccountModel.accountMap[user]!.image, fit: BoxFit.cover),
            ),
          ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${AccountModel.accountMap[user]!.firstName} ${AccountModel.accountMap[user]!.lastName}    ",style:  TextStyle(
                fontFamily: AssetsManager.font,
                fontSize: 20*SizeConfig.horizontalBlock,
                fontWeight: FontWeight.w500,
                color: MyColor.black
              ),),
              Text(user,style: TextStyle(
                fontFamily: AssetsManager.font,
                fontSize: 16*SizeConfig.horizontalBlock,
                fontWeight: FontWeight.w500,
                color: MyColor.gray9D
              ),)
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        color: MyColor.blueF8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome To Water World!',
              style: TextStyle(
                fontFamily: AssetsManager.font,
                fontWeight: FontWeight.w700,
                fontSize: 40*SizeConfig.horizontalBlock,
                color: MyColor.blue8B
              ),),
              SizedBox(height: 15*SizeConfig.verticalBlock,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  graphWidget('COD',SizeConfig.horizontalBlock,SizeConfig.verticalBlock, Provider.of<ExperimentProvider>(context,listen: false).codList,MyColor.blueAA),
                  graphWidget('BOD',SizeConfig.horizontalBlock,SizeConfig.verticalBlock, Provider.of<ExperimentProvider>(context,listen: false).bodList,MyColor.purple71),
                  graphWidget('COL',SizeConfig.horizontalBlock,SizeConfig.verticalBlock, [],MyColor.blue8B),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('  Recent Experiments',
                      style: TextStyle(
                        fontFamily: AssetsManager.font,
                        fontSize: 28*SizeConfig.horizontalBlock,
                        fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 5*SizeConfig.verticalBlock,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 327*SizeConfig.horizontalBlock,
                          height: 325*SizeConfig.verticalBlock,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColor.white,
                          ),
                          child: ListView.builder(
                            itemCount:Provider.of<RecentExperimentProvider>(context).legnthofrecentExperimentListt(),
                            itemBuilder: (context,index) =>experimentWidget(
                              RecentExperiment.recentExperimentList[index].name,
                              RecentExperiment.recentExperimentList[index].by,
                              RecentExperiment.recentExperimentList[index].date,
                              RecentExperiment.recentExperimentList[index].time,
                              SizeConfig.horizontalBlock
                            )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('   Daily Tasks',
                      style: TextStyle(
                        fontFamily: AssetsManager.font,
                        fontSize: 28*SizeConfig.horizontalBlock,
                        fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 5*SizeConfig.verticalBlock,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 327*SizeConfig.horizontalBlock,
                          height: 325*SizeConfig.verticalBlock,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColor.white,
                          ),
                          child: ListView.builder(
                            itemCount:TaskModel.taskList.length,
                            itemBuilder: (context,index) =>taskWidget(
                              TaskModel.taskList[index].iconPath,
                              TaskModel.taskList[index].description,
                              TaskModel.taskList[index].date,
                              TaskModel.taskList[index].fav,
                              SizeConfig.horizontalBlock
                            )),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: 327*SizeConfig.horizontalBlock,
                      height: 325*SizeConfig.verticalBlock,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyColor.white,
                      ),
                      child: SingleChildScrollView( 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                          
                            Stack(
                            children:[ 
                              Text('     Efficiency',
                                style: TextStyle(
                                  color: MyColor.blueB3,
                                  fontSize: 24*SizeConfig.horizontalBlock,
                                  fontWeight: FontWeight.w300
                                ),),
                              SfCircularChart(
                                series: <CircularSeries>[
                                    // Renders radial bar chart
                                    RadialBarSeries<ChartData, String>(
                                      useSeriesColor: true,
                                      trackOpacity: 0.3,
                                        dataSource: chartData,
                                        xValueMapper: (ChartData data, _) => data.x,
                                        yValueMapper: (ChartData data, _) => data.y,
                                        innerRadius: '80%'
                                    )
                                ]
                            ),
                            Positioned(
                              left: 250*SizeConfig.horizontalBlock/2,
                              top: 350*SizeConfig.verticalBlock/2,
                              child: const Text('80%',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500
                              ),)),
                            ]
                )
                          ],
                        ),),
                      ),
                    
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class ChartData {
        ChartData(this.x, this.y);
        final String x;
        final double y;
    }