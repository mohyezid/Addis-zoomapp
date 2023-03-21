import 'package:ethiozoom/resources/auth_method.dart';
import 'package:ethiozoom/resources/jitsi_meet_method.dart';
import 'package:ethiozoom/utils/colors.dart';
import 'package:ethiozoom/widgets/meeting_option.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createNewMeetings(
        room: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Join a Meetings',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 60,
          child: TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room Id',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: _joinMeeting,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Join',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MeetingOption(
            text: 'Mute Audio', isMute: isAudioMuted, onChange: onAudioMuted),
        MeetingOption(
            text: 'Turn off video',
            isMute: isVideoMuted,
            onChange: onVideoMuted),
      ]),
    );
  }

  onVideoMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onAudioMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
