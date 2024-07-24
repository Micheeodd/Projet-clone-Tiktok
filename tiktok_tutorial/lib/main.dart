import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_tutorial/constants.dart';
import 'package:tiktok_tutorial/views/screens/auth/login_screen.dart';
import 'package:tiktok_tutorial/views/screens/auth/signup_screen.dart';

import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDJU5eaYcKr-3eygbX4Pdo5PhomehtqN1k',
      appId: '1:128405637328:android:a3398f5a0584c1d49776d5',
      messagingSenderId: '128405637328',
      projectId: 'tiktok-clone-3499c',
      storageBucket: 'tiktok-clone-3499c.appspot.com',
    ),
  );

  // Enregistrez votre AuthController
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tiktok clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor ,
      ),
      home:  LoginScreen(),
    );
  }
}

