import 'package:app/screens/siginUp.dart';
import 'package:app/screens/trainhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  Widget _buildTextField({
    required String labelText,
    required bool obscureText,
    required IconData prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 196, 193, 193),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: 300,
          child: TextField(
            obscureText: obscureText,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[800],
              prefixIcon: Icon(prefixIcon, color: Colors.white),
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
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
        child: Container(
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
                  'Welcome Back!',
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
                    SizedBox(
                      height: 5,
                    ),
                    _buildTextField(
                      labelText: 'Email',
                      obscureText: false,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    _buildTextField(
                      labelText: 'Password',
                      obscureText: true,
                      prefixIcon: Icons.security,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 300,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color.fromARGB(255, 255, 255,
                                        255); // Màu khi nút được nhấn
                                  }
                                  return const Color.fromARGB(
                                      255, 0, 0, 0); // Màu bình thường
                                },
                              ),
                            ),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 196, 193, 193)),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffFED36A) // Chỉnh màu phù hợp
                          ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Trainhome()),
                          );
                        },
                        child: Text(
                          "Log In",
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
                            'Or Continue with? ',
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
                                    builder: (context) => SignUppage()),
                              );
                            },
                            child: Text(
                              'Sign Up',
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
      ),
    );
  }
}
