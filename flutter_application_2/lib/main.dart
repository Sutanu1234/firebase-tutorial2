import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:flutter_application_2/screens/email_auth/login_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/phone_auth/sign_in_with_phone.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // to fetch all data from firestore
  // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("user").get();
  
  // for(var doc in snapshot.docs){
  //   log(doc.data().toString());
  // }


  //to add a user id to firestore 

  // Map<String, dynamic> newUser = {
  //   "name": "sb",
  //   "email": "sb@gmail.com"
  // };
  
  // to set a rendom id
  //await FirebaseFirestore.instance.collection("user").add(newUser);
  // for own id
  //await FirebaseFirestore.instance.collection("user").doc("my-new-id").set(newUser);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // this will open my code to home page is i already loged in or open login page
      home: (FirebaseAuth.instance.currentUser != null) ? HomeScreen() : SignInWithPhone(),
      //home: LoginScreen(),
    );
  }
}



// correct cmd to get sha id .\gradlew signingReport
