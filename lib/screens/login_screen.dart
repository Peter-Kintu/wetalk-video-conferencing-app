
// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:wetalk/resources/auth_methods.dart';
import 'package:wetalk/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('start or join the meeting',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.png'),
          ),
          CustomButton(text: 'Google Sign In',
           onPressed: () async{

            bool res = await _authMethods.signInWithGoogle(context);
            if(res){
              Navigator.pushNamed(context, '/home');
            }
           },
           )
        ],
      ),
    );
  }
}