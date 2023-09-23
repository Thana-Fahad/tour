import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  //text controlers
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password Reset link sind!,  Check you Email.'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              //logo
              Icon(
                Icons.heart_broken,
                size: 100,
              ),
              SizedBox(height: 30),

              Text(
                "Enter Your Email and we will send you a Pasword reset link.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 15),

              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 183, 181, 181)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF33691E)),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Sing in button

              MaterialButton(
                onPressed: passwordReset,
                child: Text(
                  " Reset PassWord ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 38, 38),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                color: Color(0xFFC5E1A5),
                padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: MaterialButton(
              //     onPressed: passwordReset,
              //     child: Container(
              //        padding: EdgeInsets.fromLTRB(90, 15, 90, 15),
              //       decoration: BoxDecoration(
              //         color: Color(0xFFC5E1A5),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       child: Text(
              //         " Reset PassWord ",
              //         style: TextStyle(
              //           color: Color.fromARGB(255, 38, 38, 38),
              //           fontWeight: FontWeight.bold,
              //           fontSize: 17,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ]),
          ),
        ),
      ),
    );
  }
}
