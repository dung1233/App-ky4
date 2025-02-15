import 'package:app/main.dart';
import 'package:app/screens/BaoCao/Report_Screen.dart';
import 'package:app/screens/Khampha/Explore_Screen.dart';
import 'package:app/screens/UI/Beginer/beginer.dart';
import 'package:app/screens/Train/train_screen.dart';
import 'package:app/screens/User/User_Screen.dart';
import 'package:app/screens/Shop/shop_screen.dart'; // Import ShopScreen
import 'package:flutter/material.dart';

class Trainhome extends StatefulWidget {
  const Trainhome({Key? key}) : super(key: key);

  @override
  _TrainhomeState createState() => _TrainhomeState();
}

class _TrainhomeState extends State<Trainhome> {
  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const TrainScreen(),
    const ExploreScreen(),
    const ReportScreen(),
    const ShopScreen(),
    const UserProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          navigationBarTheme: NavigationBarThemeData(
            indicatorColor: const Color.fromARGB(255, 10, 33, 241),
            backgroundColor: Colors.white,
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return TextStyle(
                    color: const Color.fromARGB(255, 79, 59, 255),
                    fontWeight: FontWeight.bold,
                  );
                }
                return TextStyle(color: const Color.fromARGB(255, 0, 0, 0));
              },
            ),
          ),
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            _pageController.jumpToPage(index);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.timer,
                  color: selectedIndex == 0 ? Colors.white : Colors.black),
              label: 'Train',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore,
                  color: selectedIndex == 1 ? Colors.white : Colors.black),
              label: 'Khám Phá',
            ),
            NavigationDestination(
              icon: Icon(Icons.timeline,
                  color: selectedIndex == 2 ? Colors.white : Colors.black),
              label: 'Báo Cáo',
            ),
            NavigationDestination(
              icon: Icon(Icons.shop,
                  color: selectedIndex == 3 ? Colors.white : Colors.black),
              label: 'Shop', // Đúng vị trí của ShopScreen
            ),
            NavigationDestination(
              icon: Icon(Icons.person,
                  color: selectedIndex == 4 ? Colors.white : Colors.black),
              label: 'User', // Đúng vị trí của UserProfilePage
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 5,
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Ngăn swipe tay
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: _screens,
      ),
    );
  }
}
