
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_quality/controller/provider/report_provider.dart';
import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/screen/size_config.dart';

import '../colors.dart';
import '../widget/custom_app_bar.dart';
import '../widget/new_experiment_info_item.dart';

class ExperimentDetails extends StatelessWidget {
  ExperimentDetails({super.key, required this.appBarTitle, required this.duration, required this.temp, required this.textOfInstructions});
  final String appBarTitle ;
  final int duration ;
  final int temp ;
  final String textOfInstructions ;
  final inf =TextEditingController() ;
  final eff =TextEditingController();
  final blank =TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5C9CA),
       
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .13,
        ),
        child: Column(
          children: [
              CustomAppBar(
              iconName:  'assets/images/back.png',
              appBarTitle: appBarTitle,
                onPressed:  () {Navigator.pop(context);},
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ExperimentInfoItem(
                      height: MediaQuery.of(context).size.height * .11,
                      width: MediaQuery.of(context).size.width * .1,
                      title: 'Duration:',
                      child:   Center(
                        child: Text(
                          '$duration min',
                          style:const  TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ExperimentInfoItem(
                      height: MediaQuery.of(context).size.height * .11,
                      width: MediaQuery.of(context).size.width * .1,
                      title: 'Temp:',
                      child:   Center(
                        child: Text(
                          '$temp',
                          style:const  TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                ExperimentInfoItem(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width * .6,
                  title: 'Instructions:',
                  child: Text(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    textOfInstructions,
                     style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * .03,
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
                ExperimentInfoItem(
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.width * .15,
                  title: 'Equipment: ',
                  child: Text(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    "1.Digestor\n2.أنابيب أختبار",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * .03,
                    ),
                  ),
                ),
                const Spacer(),
                ExperimentInfoItem(
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.width * .11,
                  title: 'Inf:  ',
                  child: TextField(
                        style:   const TextStyle(color: Colors.black ),
                        cursorColor: Colors.black,
                        controller: inf,
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
                  width: MediaQuery.of(context).size.width * .11,
                  title: 'EFF:  ',
                  child:  TextField(
                        style:   const TextStyle(color: Colors.black ),
                        cursorColor: Colors.black,
                        controller: eff,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      )
                ),
                const Spacer(),
                ExperimentInfoItem(
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.width * .11,
                  title: 'Blank:  ',
                  child: TextField(
                  style:   const TextStyle(color: Colors.black ),
                  cursorColor: Colors.black,
                  controller: blank,
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
                      inf.text ='';
                      eff.text ='';
                      blank.text='';
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
                    eff.text.trim();
                    inf.text.trim();
                    int effValue=int.parse(eff.text);
                    int infValue=int.parse(inf.text);
                    Provider.of<ReportProvider>(context,listen: false).addExperimentToReport(ExperimentReoprt(appBarTitle,duration,infValue,effValue));
                    inf.text ='';
                    eff.text ='';
                    blank.text='';
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
    );
  }
}
