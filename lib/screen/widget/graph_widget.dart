import 'package:flutter/material.dart';
import 'package:water_quality/controller/assets_manager/assets_manager.dart';
import 'package:water_quality/screen/colors.dart';
import 'package:water_quality/screen/widget/rate_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget graphWidget(String type,double editWith,double editHighth,List rateList,Color clr){
  final List<_SalesData> data = [
    _SalesData('Tu', 3.5),
    _SalesData('We', 2.8),
    _SalesData('Th', 3.4),
    _SalesData('Fr', 3.2),
    _SalesData('Sa', 4.0),
    _SalesData('Su', 2.3),
    _SalesData('Ma', 1.2),
  ];
  return Container(
      width: 350*editWith,
      height: 250*editHighth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: MyColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(type,style: TextStyle(
                    color: MyColor.blueAA,
                    fontSize: 24*editWith,
                    fontFamily: AssetsManager.font,
                    fontWeight: FontWeight.w500
                   ),
                   ),
                   Text('Weekly insights',style: TextStyle(
                    color: MyColor.grayC9,
                    fontSize: 18*editWith,
                    fontFamily: AssetsManager.font,
                    fontWeight: FontWeight.w700
                   ),
                   ),
                 ],
                )
              ],
            ),
            if(type!='COL')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for(int i=0;i<rateList.length;i+=2)
                  rateWidget(rateList[i], clr,editWith,editHighth,rateList[i+1]),
              ],
            ),
            if(type=='COL')
            Column(children: [
          //Initialize the chart widget
          SizedBox(
            height: 160*editHighth,
            width: 300*editWith,
            child: SfCartesianChart( 
                primaryXAxis: const CategoryAxis(),
                legend: const Legend(height: 'hi',isVisible: true),
                // Enable tooltip
                 tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'COL',
                      // Enable data label
                      dataLabelSettings:const  DataLabelSettings(isVisible: true))
                ]
                ),
          ),
          
        ])
        
          ],
        ),
      ),
  
  );
}
class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}