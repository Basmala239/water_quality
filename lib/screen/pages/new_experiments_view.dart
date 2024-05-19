import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/provider/experiment_provide.dart';
import 'package:water_quality/model/account_model.dart';
import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/screen/colors.dart';
import 'package:water_quality/screen/size_config.dart';
import 'package:water_quality/screen/widget/custom_app_bar.dart';
import '../widget/new_experiment_info_item.dart';


class NewExperiments extends StatelessWidget {
  NewExperiments({super.key});
  final String user=AccountModel.currentUser;
  final duration=TextEditingController() ;
  final name=TextEditingController() ;
  final temp=TextEditingController() ;
  final equipment=TextEditingController() ;
  final instructions=TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5C9CA),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .13,
          vertical:MediaQuery.of(context).size.height * .04
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CustomAppBar(
                iconName:  'assets/images/back.png',
                appBarTitle: 'New Experiment',
                  onPressed:  () {Navigator.pop(context);},
              ),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  ExperimentInfoItem(
                    height: MediaQuery.of(context).size.height * .13,
                    width: MediaQuery.of(context).size.width * .13,
                    title: 'Name   ',
                    child: TextField(
                  style:   const TextStyle(color: Colors.black ),
                  cursorColor: Colors.black,
                  controller: name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                  ),
                  const Spacer(),
                  ExperimentInfoItem(
                    height: MediaQuery.of(context).size.height * .13,
                    width: MediaQuery.of(context).size.width * .13,
                    title: 'Duration ',
                    child: TextField(
                  style:   const TextStyle(color: Colors.black ),
                  cursorColor: Colors.black,
                  controller: duration,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                  ),
                  const Spacer(),
                  ExperimentInfoItem(
                    height: MediaQuery.of(context).size.height * .13,
                    width: MediaQuery.of(context).size.width * .13,
                    title: 'Temp  ',
                    child: TextField(
                  style:   const TextStyle(color: Colors.black ),
                  cursorColor: Colors.black,
                  controller: temp,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExperimentInfoItem(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .15,
                    title: 'Equipment  ',
                    child: TextField(
                  style:   const TextStyle(color: Colors.black ),
                  cursorColor: Colors.black,
                  controller: equipment,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExperimentInfoItem(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .3,
                    title: 'Instructions: ',
                    child: TextField(
                  style:   const TextStyle(color: Colors.black ),
                  cursorColor: Colors.black,
                  controller: instructions,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
              children: [
                Container(
                  width: 181,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color:MyColor.blueB3 ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: SizedBox(
                    width: 180,
                    height: 50,
                    child: ElevatedButton(onPressed: (){
                      name.text ='';
                      duration.text ='';
                      temp.text='';
                      instructions.text='';
                      equipment.text='';
                      Navigator.pop(context);
                    }, 
                    child:  Text('Cancel',
                    style: TextStyle(
                      color: MyColor.blueB3,
                      fontSize: 28*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600
                    ),
                    )))),
                const SizedBox(width: 10,),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    name.text.trim();
                    duration.text.trim();
                    temp.text.trim();
                    instructions.text.trim();
                    equipment.text.trim();
                    Provider.of<ExperimentProvider>(context,listen: false).addNewExperiment(ExperimentModel(name.text,int.parse(duration.text),equipment.text,int.parse(temp.text),instructions.text));
                    name.text ='';
                    duration.text ='';
                    temp.text='';
                    instructions.text='';
                    equipment.text='';
                    Navigator.pop(context);
                  }, 
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyColor.blueB3)
                    ),
                  child:  Text('Save',
                  style: TextStyle(
                      color: MyColor.white,
                      fontSize: 28*SizeConfig.horizontalBlock,
                      fontWeight: FontWeight.w600
                    ),
                  ))
                  ),
                
              ],
            ),
                
            ],
            
          ),
        ),
      ),
    );
  }
}
