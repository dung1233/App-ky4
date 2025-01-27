import 'package:app/screens/UI/Beginer/trainbeginer.dart';
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
    // Tạo danh sách các tuần
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
            // Header với thanh tiến độ
            Stack(
              children: [
                SizedBox(
                  width: 400,
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
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
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
                                  "${(progress * 100).toInt()}%",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: progress,
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

            // Danh sách tuần và các ngày
            Column(
              children: weeks.asMap().entries.map((entry) {
                int weekIndex = entry.key;
                List<int> weekDays = entry.value;

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Week ${weekIndex + 1}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildWeekGridView(
                          weekDays), // Hiển thị lưới ngày của tuần
                    ],
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20),
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
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: weekDays.length, // Số ngày trong tuần
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Mỗi hàng hiển thị 4 ngày
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, dayIndex) {
        int day = weekDays[dayIndex];
        bool isRestDay = day % 7 == 0; // Chủ nhật là ngày nghỉ
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
              child: SizedBox(
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
          ),
        );
      },
    );
  }
}
