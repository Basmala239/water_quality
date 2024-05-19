import 'package:flutter/material.dart';
import 'package:water_quality/screen/colors.dart';

Widget rateWidget(double rate,Color clr,double editWith,double editHighth,String day){
  return Column(
    children: [
      Stack(
        children: [
          Container(
            width: 16*editWith,
            height: 100*editHighth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyColor.gray9D
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 16*editWith,
              height: rate*editHighth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    clr,
                   MyColor.gray9D
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            )
          ),
        ],
      ),
      Text(day)
    ],
  );
}