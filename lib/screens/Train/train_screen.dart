import 'package:app/main.dart';
import 'package:app/screens/BaoCao/Report_Screen.dart';
import 'package:app/screens/Khampha/Explore_Screen.dart';
import 'package:app/screens/UI/Beginer/beginer.dart';
import 'package:flutter/material.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({Key? key}) : super(key: key);

  @override
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Màu nền tổng thể
      body: ListView(
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Căn nội dung về bên trái
            children: [
              _iconsUser(),
              SizedBox(
                height: 15,
              ),
              _wellcome(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Select Your Challenge",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Bọc PageView trong Expanded
              _beginer(),
              // Bọc PageView trong Expanded
              _intermediate(),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _beginer() {
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

  SizedBox _intermediate() {
    return SizedBox(
      height: 250, // Chiều cao cố định
      child: PageView(
        children: [
          SlideItem(
            title: "INTERMEDIATE\n7X4 CHALLENGE",
            description: "Power up your  in 12 weeks!",
            imagePath: "assets/img/OP3.jpg",
            onPressd: () {},
          ),
          SlideItem(
            title: "INTERMEDIATE\n7X8 CHALLENGE",
            description: "Enhance strength and build endurance!",
            imagePath: "assets/img/OP4.jpg",
            onPressd: () {},
          ),
          SlideItem(
            title: "INTERMEDIATE\n7X12 CHALLENGE",
            description: "Enhance strength and build endurance!",
            imagePath: "assets/img/OP5.jpg",
            onPressd: () {},
          ),
        ],
      ),
    );
  }

  Padding _wellcome() {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: 22, right: 20), // Đẩy xuống một chút cho đẹp
      child: Container(
        width: double.infinity, // Căng hết chiều ngang
        height: 100,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 253, 251, 251),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(204, 236, 234, 234),
                offset: Offset(0, 2),
                blurRadius: 2,
              ), // Chỉnh màu phù hợp
            ]),
        padding:
            EdgeInsets.symmetric(horizontal: 10), // Thêm padding để cân đối
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Căn đều 2 bên
          children: [
            Image.asset(
              'assets/icons/PT.png',
              width: 50,
              height: 50,
            ),

            Wrap(
              children: [
                Text(
                  'Your body might be tired,\nbut your willpower never gives up!',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),

            // Icon người dùng
          ],
        ),
      ),
    );
  }

  Padding _iconsUser() {
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: 22, right: 20), // Đẩy xuống một chút cho đẹp
      child: Container(
        width: double.infinity, // Căng hết chiều ngang
        height: 50,
        padding:
            EdgeInsets.symmetric(horizontal: 10), // Thêm padding để cân đối
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn đều 2 bên
          children: [
            Row(
              children: [
                Text(
                  'Welcome Back, ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'User',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Icon(Icons.account_circle,
                size: 30, color: Colors.black), // Icon người dùng
          ],
        ),
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback? onPressd;

  const SlideItem({
    required this.title,
    required this.description,
    required this.imagePath,
    this.onPressd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black, // Giảm màu nền để giảm hiện tượng xanh
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text(description,
                style: const TextStyle(fontSize: 14, color: Colors.white)),
            Spacer(),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: onPressd,
                child: Text("START",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
