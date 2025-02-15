import 'package:app/screens/BaoCao/Report_Screen.dart';
import 'package:app/screens/Khampha/Explore_Screen.dart';
import 'package:app/screens/Train/train_screen.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserProfilePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "User",
        style: TextStyle(fontSize: 30, color: Colors.black),
      )),
    );
  }
}
