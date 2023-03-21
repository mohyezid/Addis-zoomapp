import 'package:ethiozoom/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MeetingBtn extends StatelessWidget {
  final Function() onPressed;
  final String txt;
  final IconData icon;
  const MeetingBtn(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.txt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(0, 4))
                ]),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            txt,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
