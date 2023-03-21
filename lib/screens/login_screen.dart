import 'package:ethiozoom/resources/auth_method.dart';
import 'package:ethiozoom/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Start or join the meetings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 38),
            child: Image.asset('assets/images/onboarding.jpg')),
        CustomButton(
          onPressed: () async {
            bool res = await AuthMethods().signInWithGoogle(context);
            if (res) {
              Navigator.pushNamed(context, '/home');
            }
          },
          txt: 'Google Sign-in',
        )
      ]),
    );
  }
}
