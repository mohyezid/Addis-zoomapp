import 'package:ethiozoom/resources/auth_method.dart';
import 'package:ethiozoom/screens/history_screen.dart';
import 'package:ethiozoom/screens/meeting_screen.dart';
import 'package:ethiozoom/utils/colors.dart';
import 'package:ethiozoom/widgets/custom_button.dart';
import 'package:ethiozoom/widgets/meeting_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthMethods _auth = AuthMethods();
  int page = 0;
  onPageChange(int value) {
    setState(() {
      page = value;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    const Text('contact'),
    CustomButton(txt: 'Log Out', onPressed: () => AuthMethods().signOut())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChange,
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'meet & chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ]),
    );
  }
}
