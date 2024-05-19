import 'package:flutter/material.dart';

class ExperimentInfoItem extends StatelessWidget {
  const ExperimentInfoItem({super.key, required this.title, required this.child, required this.width, required this.height});
final String title ;
final Widget child;
final double width;
final double height;

 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text('$title : ',
    style:const  TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),),
        Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: child,
           
        )
      ],
    );
  }
}
