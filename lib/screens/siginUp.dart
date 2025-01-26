import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUppage extends StatefulWidget {
  const SignUppage({super.key});

  @override
  _SignUppageState createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  bool isChecked = false;
  // Tạo phương thức _buildTextField
  Widget _buildTextField({
    required String labelText,
    required String hintText,
    required bool obscureText,
    required IconData prefixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.grey[800],
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.white,
            ),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Màu nền tổng thể
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        // Sửa lại đúng mã màu
        toolbarHeight: 40,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/Group.svg',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Create your account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    obscureText: false,
                    prefixIcon: Icons.person_2_outlined,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildTextField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    obscureText: false,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildTextField(
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                    obscureText: true,
                    prefixIcon: Icons.security,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    isChecked = value!;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: Wrap(
                              children: [
                                Text(
                                  'I have read & agreed to DayTask',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 196, 193, 193),
                                  ),
                                ),
                                Text(
                                  "Privacy Policy,Terms & Condition",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffFED36A) // Chỉnh màu phù hợp
                        ),
                    child: TextButton(
                      onPressed: () {
                        print("Login button pressed!");
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: const Color.fromARGB(255, 196, 193, 193),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or Continue with',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 196, 193, 193),
                            ),
                          ),
                          // Khoảng cách giữa chữ và gạch
                        ),
                        Expanded(
                            child: Divider(
                          color: const Color.fromARGB(255, 196, 193, 193),
                          thickness: 1,
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        color: const Color.fromARGB(
                            255, 3, 3, 3) // Chỉnh màu phù hợp
                        ),
                    child: TextButton(
                      onPressed: () {
                        print("Login button pressed!");
                      },
                      child: Text(
                        "@ Google",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?  ',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 196, 193, 193),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()),
                            );
                          },
                          child: Text(
                            'Log in ',
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    )
                        // Khoảng cách giữa chữ và gạch
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
