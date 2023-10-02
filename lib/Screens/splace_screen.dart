import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/Screens/OmUI/main_screen.dart';
import 'package:gdsc_ui_design/utils/app_styles.dart';
import 'package:gdsc_ui_design/utils/size_config.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  bool isLoading = true;   // making a loading variable

  @override
  void initState() {
    super.initState();
    timer(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 243, 244, 1),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Your app's logo or splash image
                  Image.asset(
                    'assets/images/LOGO.png',
                    width: 150, // Adjust the size to your preference
                    height: 150,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'DU Hacks',
                    style: TextStyle(
                      fontSize: 36, // Adjust the font size
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Use a professional color
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Get your creative hats on and join us on this\nincredible ride to build something out of the box.',
                    style: TextStyle(
                      fontSize: 16, // Adjust the font size
                      color: Colors.grey, // Use a neutral color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
          if (isLoading)
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
        ],
      ),
    );
  }

  void timer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;  // after 3s, it must stop
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    });
  }
}