import 'dart:math';

import 'package:ethiozoom/resources/jitsi_meet_method.dart';
import 'package:flutter/material.dart';

import '../widgets/meeting_btn.dart';

class MeetingScreen extends StatelessWidget {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  MeetingScreen({super.key});
  createNewMeetings() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createNewMeetings(
        room: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeetings(BuildContext context) {
    Navigator.pushNamed(context, '/videocall');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MeetingBtn(
                onPressed: createNewMeetings,
                icon: Icons.videocam,
                txt: 'New Meeting'),
            MeetingBtn(
                onPressed: () => joinMeetings(context),
                icon: Icons.add_box_rounded,
                txt: 'Join Meeting'),
            MeetingBtn(
                onPressed: () {},
                icon: Icons.calendar_today,
                txt: 'Schedule Meetings'),
            MeetingBtn(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                txt: 'Share Screen'),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            'Create / Join Meetings with just a click!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ))
      ],
    );
  }
}
