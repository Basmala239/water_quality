 import 'package:flutter/material.dart';
import 'package:water_quality/model/experiment_model.dart';
import 'package:water_quality/screen/colors.dart';
import 'package:water_quality/screen/pages/experiment_details_view.dart';

 Widget experimentItem(ExperimentModel exm,context,double editwidth) {
    return  Column(
        children: [
          Container(
            height: 100,
            width: 204*editwidth,
            padding: const EdgeInsets.all(20),
            decoration:const BoxDecoration(
              color:  Color(0xff378eb3),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:  Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                exm.name,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .03,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 204*editwidth,
            alignment: Alignment.center,
             decoration:const BoxDecoration(
              color: MyColor.blueE6,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight:  Radius.circular(12)),
            ),
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (contsxt)=>ExperimentDetails(appBarTitle: exm.name, duration: exm.duration, temp: exm.temp, textOfInstructions: exm.instructions)));},
               child: const Text('View')),
            ),
          )
        ],
      
    );
  }




/*
 onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ExperimentDetails(),
          ),
        );
      },
      */
