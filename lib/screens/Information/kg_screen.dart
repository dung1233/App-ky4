<<<<<<< HEAD
import 'package:app/data/local_storage.dart';
import 'package:app/screens/Information/activity_screen.dart';
import 'package:app/widget/elevatedButton.dart';
import 'package:flutter/foundation.dart';
=======
import 'package:app/data/local.dart';
import 'package:app/screens/Information/activity_screen.dart';
import 'package:app/widget/elevatedButton.dart';
>>>>>>> Minh
import 'package:flutter/material.dart';

class KgScreen extends StatefulWidget {
  const KgScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KgScreenState createState() => _KgScreenState();
}

class _KgScreenState extends State<KgScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadKg();
    _controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    _controller.removeListener(_validateInput);
    _controller.dispose();
    super.dispose();
  }

  void _loadKg() async {
    Map<String, dynamic> userData = await LocalStorage.loadUserData();
<<<<<<< HEAD
    int? savedweight = userData['weight']; // Lấy giá trị từ local storage

    if (kDebugMode) {
      print("📌 weight đã lưu trong LocalStorage: $savedweight");
    }

    if (savedweight != null && savedweight >= 35 && savedweight <= 100) {
      setState(() {
        _controller.text = savedweight.toString();
=======
    int? savedKg = userData['kg']; // Lấy giá trị từ local storage

    print("📌 Kg đã lưu trong LocalStorage: $savedKg");

    if (savedKg != null && savedKg >= 35 && savedKg <= 100) {
      setState(() {
        _controller.text = savedKg.toString();
>>>>>>> Minh
        isButtonEnabled = true; // Chỉ bật nút nếu hợp lệ
      });
    } else {
      setState(() {
        _controller.text = ""; // Nếu không hợp lệ thì để trống
        isButtonEnabled = false;
      });
    }
  }

  void _validateInput() {
<<<<<<< HEAD
    int? weight = int.tryParse(_controller.text.trim()); // Chuyển thành số
    setState(() {
      isButtonEnabled = weight != null && weight >= 35 && weight <= 100;
=======
    int? kg = int.tryParse(_controller.text.trim()); // Chuyển thành số
    setState(() {
      isButtonEnabled = kg != null && kg >= 35 && kg <= 100;
>>>>>>> Minh
    });
  }

  void _onNextPressed() async {
<<<<<<< HEAD
    int? weight = int.tryParse(_controller.text.trim());
    if (weight != null && weight >= 35 && weight <= 100) {
      await LocalStorage.saveUserData(weight: weight);
      Navigator.push(
        // ignore: use_build_context_synchronously
=======
    int? kg = int.tryParse(_controller.text.trim());
    if (kg != null && kg >= 35 && kg <= 100) {
      await LocalStorage.saveUserData(kg: kg);
      Navigator.push(
>>>>>>> Minh
        context,
        MaterialPageRoute(builder: (context) => ActivityScreen()),
      );
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
                  "Please enter your weight (kg)", // Sửa câu từ cho tự nhiên hơn
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controller, // Gán controller
                keyboardType: TextInputType.number, // Chỉ nhập số
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: 'Kg'),
              ),
            ),
            const Spacer(),
            Buttonscreen(
              onPressed: isButtonEnabled ? _onNextPressed : null,
              isEnabled: isButtonEnabled,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
