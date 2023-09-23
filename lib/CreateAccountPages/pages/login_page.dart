import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';//font style
import 'package:tour/CreateAccountPages/pages/forgot_password_page.dart';
//import 'package:tourapp/CreateAccountPages/pages/home_page.dart';
import 'package:tour/CreateAccountPages/pages/register_page.dart';
import 'package:tour/pages/onboarding_page.dart';



class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // show and hide the password
  bool _obsecureText = true;
  //text controlers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future SingIn( String email, String password ) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.heart_broken,
                  size: 100,
                ),
                SizedBox(height: 75),

                //hello msg
                Text(
                  "Hello Again!",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome Back, You\'r been missed!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                SizedBox(height: 50),

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
                        borderRadius: BorderRadius.circular(13),
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
                        borderRadius: BorderRadius.circular(13),
                      ),
                      hintText: "Passwoed",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 10),

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

                // Sing in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async { //open the Home page if thay have not any error
                  try {
                    await SingIn(
                        _emailController.text.trim(),
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
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: const Text(
                                    " Invalid Email or password. Please register again or make sure that username and password is correct"),
                                actions: [
                                  ElevatedButton(
                                    child: const Text("Register Now"),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                           MaterialPageRoute(builder: (context) => RegisterPage(showLoginPage: () => true)));
                                                  },
                                               )
                                        ]));
                                       }
                                    },
                       child: Container(
                       padding: EdgeInsets.fromLTRB(140, 15, 140, 15),
                       decoration: BoxDecoration(
                        color: Color(0xFFC5E1A5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Sing in",
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
                      "Don't have an account?",
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
                                    RegisterPage(showLoginPage: () => true)));
                      },
                      child: Text(
                        "  Register Now",
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
