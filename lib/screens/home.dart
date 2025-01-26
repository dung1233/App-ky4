import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color(0x29323d),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          _isssa(),
          SizedBox(
            height: 15,
          ),
          _letgo(),
          SizedBox(
            height: 05,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginpage()));
              },
              child: Container(
                constraints: BoxConstraints.tightFor(width: 300, height: 55),
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/pama.svg',
                    ),
                    Text(
                      "Let's Start",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center _letgo() {
    return Center(
        child: Container(
      constraints: BoxConstraints.tightFor(width: 300, height: 250),
      child: SvgPicture.asset(
        'assets/icons/DayTask.svg',
        height: 200,
      ),
    ));
  }

  Center _isssa() {
    return Center(
      child: Container(
        constraints: BoxConstraints.tightFor(
          width: 300, // Kích thước cố định cho chiều rộng
          height: 250, // Kích thước cố định cho chiều cao
        ),
        color: Colors.white,
        child: SvgPicture.asset(
          'assets/icons/pana.svg',
          height: 200,
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Color(0x29323d),
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SvgPicture.asset(
          'assets/icons/Group.svg',
          width: 70,
        ),
      ),
    );
  }
}
