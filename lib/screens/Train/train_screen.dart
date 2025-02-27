// ignore_for_file: prefer_const_constructors

import 'package:app/screens/Train/beginer_screnn.dart';
import 'package:app/screens/Train/icons_user.dart';
import 'package:app/screens/Train/intermediate.dart';
import 'package:app/screens/Train/wellcome.dart';

import 'package:flutter/material.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrainhomeState createState() => _TrainhomeState();
}

class _TrainhomeState extends State<TrainScreen> {
  int selectedIndex = 0;
  String userName = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 5,
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255), // Màu nền của AppBar
      ),
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Màu nền tổng thể
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
        itemCount: 4, // Số phần tử trong danh sách
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return IconsUser(); // Không dùng const vì có thể thay đổi dữ liệu
            case 1:
              return Wellcome(); // Không dùng const để cập nhật UI khi cần
            case 2:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Select Your Challenge",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            case 3:
              return Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  BeginnerScreen(), // Có thể lấy dữ liệu từ API
                  Intermediate(), // Có thể thay đổi dựa trên API
                ],
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
