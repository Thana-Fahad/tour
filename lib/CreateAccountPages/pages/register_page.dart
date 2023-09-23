import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour/CreateAccountPages/pages/forgot_password_page.dart';
import 'package:tour/CreateAccountPages/pages/login_page.dart';

//import 'package:tourapp/CreateAccountPages/test_page.dart';
import 'package:tour/pages/onboarding_page.dart'; //font style

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // show and hide the password
  bool _obsecureText = true;

  //Radio button
  //String Gender = "Male";
  //drop doun putton
  //List<String> list = <String>['Male', 'Female'];

  //text controlers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _usernameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future SingUp(String email, String password) async {
    if (passwordConfirm()) {
      // Create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // add user detalis
      addUserDetails(
        _usernameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_ageController.text.trim()),
        _genderController.text.trim(),
      );
    }
  }

  // Function to add user detels in the database
  Future addUserDetails(String username, String email, int age, String gender) async {
    await FirebaseFirestore.instance.collection('users').add({
      'user name': username,
      'email': email,
      'age': age,
      'Gender':gender,
    });
  }

  // Password Confirm check
  bool passwordConfirm() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //for drop doun button
    //String dropdownValue = list.first;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // //logo
                // Icon(
                //   Icons.heart_broken,
                //   size: 100,
                // ),
                // SizedBox(height: 30),

                //hello msg
                Text(
                  "Sing Up!",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Create A new Account , Pless Answer all Questions.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),

                SizedBox(height: 20),

                // User Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 183, 181, 181)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF33691E)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "User Name",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 183, 181, 181)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF33691E)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: _obsecureText,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      //show and hide pass
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        icon: Icon(_obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ), //show and hide pass
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 183, 181, 181)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF33691E)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Passwoed",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // confirm Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: _obsecureText,
                    controller: _confirmpasswordController,
                    decoration: InputDecoration(
                      //show and hide pass
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        icon: Icon(_obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ), //show and hide pass
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 183, 181, 181)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF33691E)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Confirm Passwoed",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //age
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 183, 181, 181)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF33691E)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Age",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                 //Gender
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _genderController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 183, 181, 181)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF33691E)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Gender : Male OR Female",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //Gender Radio Button
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     children: [
                //       Column(children: [
                //         Text(
                //           "Gender",
                //           style: TextStyle(
                //             backgroundColor: Color.fromARGB(255, 183, 181, 181),
                //             fontSize: 15,
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.only(left: 15),
                //           child: Row(
                //             children: [
                //               Radio(
                //                   value: "Male",
                //                   groupValue: Gender,
                //                   onChanged: (value) {
                //                     setState(() {
                //                       Gender = value!;
                //                     });
                //                   }),
                //               const Text(
                //                 "Male",
                //                 style: TextStyle(
                //                   backgroundColor:
                //                       Color.fromARGB(255, 183, 181, 181),
                //                   fontSize: 15,
                //                 ),
                //               ),
                //                const SizedBox(width: 20),
                //                Radio(
                //                   value: "Femail",
                //                   groupValue: Gender,
                //                   onChanged: (value) {
                //                     setState(() {
                //                       Gender = value!;
                //                     });
                //                   }),
                //               const Text(
                //                 "Femail",
                //                 style: TextStyle(
                //                   backgroundColor:
                //                       Color.fromARGB(255, 183, 181, 181),
                //                   fontSize: 15,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ]),
                //     ],
                //   ),
                // ),

                // //test Drop doun Gender button
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(135, 10, 135, 10),
                //     decoration: BoxDecoration(
                //       border:
                //           Border.all(color: Color.fromARGB(255, 183, 181, 181)),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: DropdownButton<String>(
                //       dropdownColor: Colors.white,
                //       value: dropdownValue,
                //       icon: const Icon(Icons.arrow_downward),
                //       iconSize: 15,
                //       elevation: 16,
                //       style: const TextStyle(color: Color(0xFF33691E)),
                //       underline: SizedBox(
                //         height: 2,
                //       ),
                //       onChanged: (String? value) {
                //         // This is called when the user selects an item.
                //         setState(() {
                //           dropdownValue = value!;
                //         });
                //       },
                //       items: list.map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),

                //forget Password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?    ",
                          style: TextStyle(
                            color: Color(0xFF33691E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // Sing Up Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    // error msg
                    onTap: () async {
                      //open the Home page if thay have not any error
                      try {
                        await SingUp(_emailController.text.trim(),
                            _passwordController.text.trim());
                        if (FirebaseAuth.instance.currentUser != null) {
                          if (!mounted) return;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OnboardingPage()));
                        }
                      } on FirebaseException catch (e) {
                        debugPrint("error is ${e.message}");
                      }
                    },

                    child: Container(
                      //padding: EdgeInsets.all(20 ),
                      padding: EdgeInsets.fromLTRB(135, 15, 135, 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFC5E1A5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Sing Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 38, 38),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                //regester new
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I am a Member!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginPage(showRegisterPage: () => true)));
                      },
                      child: Text(
                        " Sing up now",
                        style: TextStyle(
                          color: Color(0xFF33691E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
