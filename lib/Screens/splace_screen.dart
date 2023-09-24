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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/LOGO.png',
                width: 130,
                height: 130,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'DU Hacks',
                style: kRalewayMedium.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 5,
                    color: kBlue),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Get your creative hats on and join us on this\n incredible ride to build something out of the box.',
                style: kRalewayMedium.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void timer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    });
  }
}
