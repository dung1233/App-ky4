import 'package:app/data/local.dart';
import 'package:app/screens/Information/fitness_goal.dart';
import 'package:app/screens/Information/themloading.dart';
import 'package:app/widget/elevatedButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<Map<String, String>> options = [
    {"title": "Low", "icon": "assets/icons/lowa.png"},
    {"title": "Moderate", "icon": "assets/icons/medium.png"},
    {"title": "High", "icon": "assets/icons/Fire.png"},
  ];

  int selectedOption = -1;

  @override
  void initState() {
    super.initState();
    _loadactivity();
  }

  void _loadactivity() async {
    Map<String, dynamic> userData = await LocalStorage.loadUserData();
    String saveactivity = userData['activity'] ?? "";
    int index =
        options.indexWhere((options) => options['title'] == saveactivity);
    if (index != -1) {
      setState(() {
        selectedOption = index;
      });
    }
    if (kDebugMode) {
      print("🔥 activity đã lưu: $saveactivity");
    } // De
  }

  void _saveactivity() async {
    String activity = options[selectedOption]['title']!;
    await LocalStorage.saveUserData(activity: activity);
    if (kDebugMode) {
      print("✅ activity đã  lưu moi: $activity");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: SizedBox(
                height: 100,
                width: 220,
                child: Text(
                  "What is your activity level ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = index;
                      });
                      _saveactivity();
                    },
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 110, 110, 110)),
                        color: selectedOption == index
                            ? Colors.white
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            options[index]["icon"]!,
                            width: 35,
                            height: 55,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            options[index]["title"]!,
                            style: TextStyle(
                                color: selectedOption == index
                                    ? Colors.black
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Buttonscreen(
              isEnabled: selectedOption != -1,
              onPressed: () async {
                if (selectedOption == -1) return;
                String activity = options[selectedOption]['title']!;
                await LocalStorage.saveUserData(activity: activity);
                Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FitnessGoal()));
              },
            ),
            // Truyền trạng thái vào nút START
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
