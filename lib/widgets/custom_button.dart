import 'package:ethiozoom/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final Function() onPressed;
  const CustomButton({super.key, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: buttonColor))),
        onPressed: onPressed,
        child: Text(txt, style: TextStyle(fontSize: 17)),
      ),
    );
  }
}
