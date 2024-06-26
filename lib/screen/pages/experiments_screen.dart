import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/controller/provider/experiment_provide.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/screen/pages/new_experiments_view.dart';
import 'package:water_quality/screen/size_config.dart';
import 'package:water_quality/screen/widget/experiment_item.dart';
import 'package:flutter/material.dart';
class ExperimentsScreen extends StatefulWidget {
  const ExperimentsScreen({super.key});

  @override
  State<ExperimentsScreen> createState() => _ExperimentsScreenState();
}

class _ExperimentsScreenState extends State<ExperimentsScreen> {
  List <QueryDocumentSnapshot>data=[];
  addToList(){
    Provider.of<ExperimentProvider>(context,listen: false).empty();
    for(int i=0;i<data.length;i++){
        ExperimentModel ex=ExperimentModel(data[i]['name'],data[i]['duration'],data[i]['equipment'],data[i]['temp'],data[i]['instructions']);
        Provider.of<ExperimentProvider>(context,listen: false).addNewExperiment(ex);
    }
  }
  getExperimentType()async{
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection('experimentType').get();
    data.addAll(querySnapshot.docs);
    addToList();
  }
  @override
  void initState() {
    getExperimentType();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        
        body: SingleChildScrollView(
          child:Stack(
            children:[
              Positioned(
                height: 1024*SizeConfig.verticalBlock,
                width: 908*SizeConfig.horizontalBlock,
                top: 0,
                left: 0,
                  child: SvgPicture.asset( 
                            AssetsManager.backgroundImage, 
                            height: 1024*SizeConfig.verticalBlock,
                            width: 908*SizeConfig.horizontalBlock,
                             fit: BoxFit.fill, 
                          ),
                ),
               Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset(
                      'assets/images/back.png',
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      'Experiments',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if(AccountModel.accountMap[AccountModel.currentUser]!.jobTitle=='IT Depertment')
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return NewExperiments();
                        },
                      ));
                    },
                    icon: Image.asset(
                      'assets/images/add.png',
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              SizedBox(
                width: double.infinity,
                height: 500*SizeConfig.verticalBlock,
                child: GridView.builder(
                  shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, 
                      mainAxisSpacing: 8.0, 
                      crossAxisSpacing: 8.0, 
                      ),
                      padding: const EdgeInsets.all(8.0), 
                      itemCount: Provider.of<ExperimentProvider>(context).legnthofExperimentList(), 
                      itemBuilder: (context, index)=>experimentItem(ExperimentModel.experimentList[index],context,SizeConfig.horizontalBlock),
                    
                  
                  ),
                      ),
              ]),
          ])     
          )
        );
  }
}


