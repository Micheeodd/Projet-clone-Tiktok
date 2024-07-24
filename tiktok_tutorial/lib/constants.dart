import 'package:flutter/material.dart';
import 'package:tiktok_tutorial/views/screens/profile_screen.dart';
import 'package:tiktok_tutorial/views/screens/search_screen.dart';

List pages = [
  SearchScreen(),
  Text('Messages Screen'),
  ProfileScreen(uid: authController.user.uid),
]

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;