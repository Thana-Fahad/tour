
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour/CreateAccountPages/pages/login_page.dart';
import 'package:tour/CreateAccountPages/pages/register_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  

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
                  "Tour App",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome to TOUR Application!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                SizedBox(height: 50),

                //Log in

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(showRegisterPage: () => true)));
                    },
                    child: Container(
                      //padding: EdgeInsets.all(20 ),
                      padding: EdgeInsets.fromLTRB(140, 15, 140, 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFC5E1A5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 38, 38),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                //Sing up

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage(showLoginPage: () => true)));
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
                    // Text(
                    //   "Don't have an account?",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    GestureDetector(
                      //onTap: widget.showRegisterPage,
                      child: Text(
                        "Continue as a Guest",
                        style: TextStyle(
                          color: Color(0xFF33691E),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
