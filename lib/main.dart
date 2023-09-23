import 'package:tour/pages/onboarding_page.dart';
import 'package:tour/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour/CreateAccountPages/pages/welcome_page..dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const OnboardingPage();
          } else {
            return const WelcomePage();
          }
        },
      ),
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkgreen1),
      //   useMaterial3: true,
      //   textTheme: GoogleFonts.mulishTextTheme(),
      // ),
      // home: const WelcomePage(),
    );
  }

  

  
}
