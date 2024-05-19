
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.color, required this.text, required this.backgroundColor,
  });
  final Color color;
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .1,
      height: MediaQuery.of(context).size.height * .05,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child:   Center(
        child: Text(
         text,
          style: TextStyle(
            color:  color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
