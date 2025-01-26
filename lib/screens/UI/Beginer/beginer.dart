import 'package:app/screens/UI/Beginer/trainbeginer.dart';
import 'package:app/screens/siginUp.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Beginer extends StatefulWidget {
  const Beginer({Key? key}) : super(key: key);

  @override
  _BeginerState createState() => _BeginerState();
}

class _BeginerState extends State<Beginer> {
  final int totalDays = 28; // Tổng số buổi tập
  final int daysPerWeek = 7; // Số buổi tập mỗi tuần

  double progress = 0.0; // Tiến độ (0 -> 1.0)

  @override
  Widget build(BuildContext context) {
    List<List<int>> weeks = [];
    for (int i = 0; i < totalDays; i += daysPerWeek) {
      weeks.add(List.generate(daysPerWeek, (index) => i + index + 1)
          .where((day) => day <= totalDays)
          .toList());
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 2,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage("assets/img/OIP.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.blue.withOpacity(0.2),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BEGINER CHALLENGE",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Thanh tiến độ
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 70, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "28 Days left",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "${(progress * 100).toInt()}%", // Hiển thị phần trăm
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: progress, // Giá trị tiến độ
                            backgroundColor: Colors.white.withOpacity(0.5),
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 300,
              height: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromARGB(204, 236, 234, 234),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 13, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/icons/PT.png',
                            width: 40,
                            height: 40,
                          ),
                          Wrap(
                            children: [
                              Text(
                                'Your body might be tired,\nbut your willpower never gives up!',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                SizedBox(
                  width: 280,
                  height: 180,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageView.builder(
                        itemCount: weeks.length, // Số tuần
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Week ${index + 1}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: _buildWeekGridView(
                                    weeks[index]), // Truyền tuần hiện tại
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 280,
                  height: 180,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageView.builder(
                        itemCount: weeks.length, // Số tuần
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Week ${index + 2}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: _buildWeekGridView(
                                    weeks[index]), // Truyền tuần hiện tại
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 280,
                  height: 180,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageView.builder(
                        itemCount: weeks.length, // Số tuần
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Week ${index + 3}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: _buildWeekGridView(
                                    weeks[index]), // Truyền tuần hiện tại
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 280,
                  height: 180,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageView.builder(
                        itemCount: weeks.length, // Số tuần
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Week ${index + 4}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: _buildWeekGridView(
                                    weeks[index]), // Truyền tuần hiện tại
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("GO",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeekGridView(List<int> weekDays) {
    // Danh sách các icon luyện tập có thể có
    List<IconData> workoutIcons = [
      Icons.fitness_center, // Tạ
      Icons.directions_run, // Cardio
      Icons.accessibility_new, // Yoga

      Icons.airline_seat_recline_normal, // Giãn cơ
    ];

    Random random = Random();

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: weekDays.length, // Số ngày trong tuần
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Mỗi hàng hiển thị 4 ngày
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, dayIndex) {
        int day = weekDays[dayIndex]; // Lấy ngày từ tuần
        bool isRestDay = day % 7 == 0; // Chủ nhật là ngày nghỉ

        // Chọn icon ngẫu nhiên từ danh sách workoutIcons
        IconData workoutIcon =
            workoutIcons[random.nextInt(workoutIcons.length)];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AIMyWidget()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(204, 218, 214, 214),
                  offset: Offset(0, 2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isRestDay ? Icons.free_breakfast_outlined : workoutIcon,
                    color: isRestDay ? Colors.green : Colors.blue,
                    size: 20,
                  ),
                  Text(
                    "$day",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
