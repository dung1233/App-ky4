import 'package:app/screens/Train/slide_Item.dart';
import 'package:app/screens/UI/Beginer/beginer.dart';
import 'package:flutter/material.dart';

class BeginnerScreen extends StatefulWidget {
  const BeginnerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BeginerState createState() => _BeginerState();
}

class _BeginerState extends State<BeginnerScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Chiều cao cố định
      child: PageView(
        children: [
          SlideItem(
            title: "BEGINER\n7X4 CHALLENGE",
            description: "Power up your  in 4 weeks!",
            imagePath: "assets/img/OIP.jpg",
            onPressd: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Beginer()));
            },
          ),
          SlideItem(
            title: "BEGINER\n7X8 CHALLENGE",
            description: "Enhance strength and build endurance!",
            imagePath: "assets/img/OP2.jpg",
            onPressd: () {},
          ),
          SlideItem(
            title: "BEGINER\n7X12 CHALLENGE",
            description: "Enhance strength and build endurance!",
            imagePath: "assets/img/OP.jpg",
            onPressd: () {},
          ),
        ],
      ),
    );
  }
}
