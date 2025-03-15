<<<<<<< HEAD
import 'package:app/data/local_storage.dart';
import 'package:app/screens/Information/level_data.dart';

=======
import 'package:app/data/local.dart';
import 'package:app/screens/Information/themloading.dart';
>>>>>>> Minh
import 'package:app/widget/elevatedButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MedicalConditions extends StatefulWidget {
  const MedicalConditions({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicalConditionsState createState() => _MedicalConditionsState();
}

class _MedicalConditionsState extends State<MedicalConditions> {
  final List<Map<String, String>> options = [
    {"title": "Tim mạch", "icon": "assets/icons/traitim.png"},
    {"title": "Xương khớp", "icon": "assets/icons/xuong.png"},
    {"title": "Huyết áp cao/thấp", "icon": "assets/icons/huyetap.png"},
    {"title": "Không có bệnh lý đặc biệt", "icon": "assets/icons/Carrot.png"},
  ];
  int selectedOption = -1;

  @override
  void initState() {
    super.initState();
    _loadmedical();
  }

  void _loadmedical() async {
    Map<String, dynamic> userData = await LocalStorage.loadUserData();
<<<<<<< HEAD
    String savemedical = userData['medical_conditions'] ?? "";
=======
    String savemedical = userData['medical'] ?? "";
>>>>>>> Minh
    int index =
        options.indexWhere((options) => options['title'] == savemedical);
    if (index != 1) {
      setState(() {
        selectedOption = index;
      });
    }

    if (kDebugMode) {
      print("medical da luu : $savemedical ");
    }
  }

  void _savemedical() async {
<<<<<<< HEAD
    String medicalConditions = options[selectedOption]['title']!;
    await LocalStorage.saveUserData(medical_conditions: medicalConditions);
    if (kDebugMode) {
      print('✅ da luu medical moi: $medicalConditions');
=======
    String medical = options[selectedOption]['title']!;
    await LocalStorage.saveUserData(medical: medical);
    if (kDebugMode) {
      print('✅ da luu medical moi: $medical');
>>>>>>> Minh
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
                width: 120,
                child: Text(
                  "Tiền sử bệnh lý ?",
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
                      _savemedical();
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
<<<<<<< HEAD
                String medicalConditions = options[selectedOption]['title']!;
                await LocalStorage.saveUserData(
                    medical_conditions: medicalConditions);
=======
                String medical = options[selectedOption]['title']!;
                await LocalStorage.saveUserData(medical: medical);
>>>>>>> Minh
                Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
<<<<<<< HEAD
                        builder: (BuildContext context) => Leverdata()));
=======
                        builder: (BuildContext context) =>
                            ThemLoadingScreen()));
>>>>>>> Minh
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
