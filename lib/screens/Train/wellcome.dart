import 'package:flutter/material.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WellcomeState createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10, left: 22, right: 20), // Đẩy xuống một chút cho đẹp
      child: Container(
        width: double.infinity, // Căng hết chiều ngang
        height: 100,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 253, 251, 251),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(204, 236, 234, 234),
                offset: Offset(0, 2),
                blurRadius: 2,
              ), // Chỉnh màu phù hợp
            ]),
        padding: const EdgeInsets.symmetric(
            horizontal: 10), // Thêm padding để cân đối
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Căn đều 2 bên
          children: [
            Image.asset(
              'assets/icons/PT.png',
              width: 50,
              height: 50,
            ),

            const Wrap(
              children: [
                Text(
                  'Your body might be tired,\nbut your willpower never gives up!',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),

            // Icon người dùng
          ],
        ),
      ),
    );
  }
}
