import 'package:app/screens/login.dart';
import 'package:app/screens/trainhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Điều hướng sang trang khác
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Loginpage()), // Thay NewScreen bằng trang khác của em
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color(0x29323d),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.96, // Chiều cao cố định
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                SlideItem(
                  title: "Choose Your Level",
                  description:
                      "One of the most common layout patterns is to arrange widgets vertically or horizontally!",
                  imagePath: "assets/img/banner.jpg",
                  onPressd: _nextPage,
                ),
                SlideItem(
                  title: "Overcome Challenges",
                  description:
                      "Push beyond your limits and face every obstacle head-on with courage and determination!",
                  imagePath: "assets/img/OP4.jpg",
                  onPressd: _nextPage,
                ),
                SlideItem(
                  title: "Challenge Your Limits",
                  description:
                      "Dare to step outside your comfort zone and discover the strength you never knew you had!",
                  imagePath: "assets/img/banner1.jpg",
                  onPressd: _nextPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(0x29323d),
      toolbarHeight: 2,
    );
  }
}

class SlideItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onPressd; // onPressd bắt buộc

  const SlideItem({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onPressd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity, // Đảm bảo Container full màn hình
      decoration: BoxDecoration(
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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: onPressd, // Gọi hàm onPressd từ HomePage
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
