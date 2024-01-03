import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:flutter_application_2/screens/email_auth/signup_screen.dart';
import 'package:flutter_application_2/screens/phone_auth/verify_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({ Key? key }) : super(key: key);

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {

  TextEditingController phoneController = TextEditingController();

  void sendOTP() async {
    String phone = "+91" + phoneController.text.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) => VerifyOtpScreen(
            verificationId: verificationId,
          )
        ));
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        log(ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 30)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In with Phone"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Phone Number"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {
                      sendOTP();
                    },
                    color: Colors.blue,
                    child: Text("Sign In"),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}