import 'package:ethiozoom/utils/colors.dart';
import 'package:flutter/material.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOption(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Switch.adaptive(value: isMute, onChanged: onChange)
      ]),
    );
  }
}
