<<<<<<< HEAD
=======
import 'package:app/screens/Train/beginerdata.dart';
>>>>>>> Minh
import 'package:flutter/material.dart';

class BeginnerDataWidget extends StatelessWidget {
  const BeginnerDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final List<List<Map<String, String>>> weeks = [
      [
        {
          "day": "Day 1",
          "exercise": "🏋️ Squat & Push-up",
          "desc": "Khởi động sức mạnh",
          "status": "completed"
        },
        {
          "day": "Day 2",
          "exercise": "🤸 Plank & Lunges",
          "desc": "Tăng cường cơ core",
          "status": "pending"
        },
        {
          "day": "Day 3",
          "exercise": "💪 Deadlifts & Pull-ups",
          "desc": "Bài tập nâng cao sức mạnh lưng",
          "status": "pending"
        },
        {
          "day": "Day 4",
          "exercise": "🏃 Jump Rope & HIIT",
          "desc": "Luyện tập cường độ cao",
          "status": "pending"
        },
      ],
      [
        {
          "day": "Day 1",
          "exercise": "🏋️ Squat & Push-up",
          "desc": "Khởi động sức mạnh",
          "status": "completed"
        },
        {
          "day": "Day 2",
          "exercise": "🤸 Plank & Lunges",
          "desc": "Tăng cường cơ core",
          "status": "pending"
        },
        {
          "day": "Day 3",
          "exercise": "💪 Deadlifts & Pull-ups",
          "desc": "Bài tập nâng cao sức mạnh lưng",
          "status": "pending"
        },
        {
          "day": "Day 4",
          "exercise": "🏃 Jump Rope & HIIT",
          "desc": "Luyện tập cường độ cao",
          "status": "pending"
        },
      ]
    ];

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: weeks.asMap().entries.map((entry) {
          int weekIndex = entry.key;
          List<Map<String, String>> weekData = entry.value;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tiêu đề tuần đẹp hơn
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.green, Colors.teal],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Week ${weekIndex + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('0/6 Days',
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Bắt đầu tuần tập luyện đầu tiên với các bài tập cơ bản, giúp cải thiện sức mạnh và sức bền.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),

                // Danh sách bài tập đẹp hơn
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: weekData.length,
                  itemBuilder: (context, index) {
                    final exercise = weekData[index];
                    Color dotColor = exercise["status"] == "completed"
                        ? Colors.green
                        : Colors.grey;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        child: Row(
                          children: [
                            // Icon bên trái
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Icon(Icons.fitness_center,
                                  color: Colors.deepPurple, size: 30),
                            ),
                            const SizedBox(width: 15),

                            // Nội dung bài tập
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exercise["day"]!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    exercise["exercise"]!,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  ),
                                  Text(
                                    exercise["desc"]!,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),

                            // Nút trạng thái
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: dotColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
=======
    return Column(
      children: beginnerWorkouts.map((workout) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                workout["completed"]
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: workout["completed"] ? Colors.green : Colors.grey,
              ),
              title: Text("Day ${workout['day']} - ${workout['title']}"),
              subtitle: Text(workout["description"]),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              onTap: () {
                // Xử lý điều hướng đến màn hình tập luyện của ngày đó
              },
            ),
          ),
        );
      }).toList(),
>>>>>>> Minh
    );
  }
}
