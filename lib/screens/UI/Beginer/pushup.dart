<<<<<<< HEAD
=======
import 'package:app/screens/TEST/pushup_detector_view.dart';
>>>>>>> Minh
import 'package:flutter/material.dart';

class Pushup extends StatefulWidget {
  const Pushup({super.key});

  @override
  State<Pushup> createState() => _PushupState();
}

class _PushupState extends State<Pushup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Push UP',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Placeholder cho camera
<<<<<<< HEAD
          Container(
            width: 400,
            height: 450,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(
                Icons.image,
                size: 100,
                color: Colors.grey,
              ),
            ),
=======
          // Thay thế Placeholder bằng PushupDetectorView
          SizedBox(
            width: 400,
            height: 450,
            child: PushUpDetectorView(),
>>>>>>> Minh
          ),
          const SizedBox(height: 20),
          // Các thông tin khác
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Left Column (TG và Thời gian còn lại)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.blueAccent,
                          size: 28,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "TG",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 8), // Khoảng cách giữa TG và Thời gian còn lại
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '00:30', // Thay thế bằng giá trị bạn tính toán được
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),

                // Right Column (Gap bung và Số lần tập còn lại)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.fitness_center,
                          color: Colors.orange,
                          size: 28,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Push-UP",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height:
                            8), // Khoảng cách giữa Gap bung và Số lần còn lại
                    Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Text(
                        '5', // Thay thế bằng giá trị bạn tính toán được
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 72, 231, 93),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text("START",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
