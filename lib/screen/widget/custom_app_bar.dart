import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarTitle, required this.iconName, required this.onPressed,
  });
  final String appBarTitle;
    final String iconName;
     final  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Image.asset(
           iconName,
          ),
        ),
        const Spacer(),
        Center(
          child: Text(
            appBarTitle,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
