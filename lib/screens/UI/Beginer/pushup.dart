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
        title: Text(
          'Push UP',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 450,
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    "TG",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Gap bung',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
