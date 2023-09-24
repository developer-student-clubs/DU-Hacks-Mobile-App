import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/Screens/OmUI/main_screen.dart';
import 'package:gdsc_ui_design/Screens/original_ui_challege.dart';
import 'package:gdsc_ui_design/utils/app_styles.dart';
import 'package:gdsc_ui_design/utils/size_config.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 243, 244, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/gdcs_logo.png',
                  width: 130,
                  height: 130,
                ),
                Text(
                  'Google Student Developer Clubs',
                  style: kRalewayMedium.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: kBlue),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'UI Challenge',
                  style: kRalewayMedium.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 20,
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 70,
                  height: SizeConfig.blockSizeVertical! * 5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UIChallenge()),
                      );
                    },
                    child: Text(
                      "Given UI Task By GDSC",
                      style: kRalewayMedium.copyWith(color: kBlue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 70,
                  height: SizeConfig.blockSizeVertical! * 5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()),
                      );
                    },
                    child: Text(
                      "Same Concept With My Creativity",
                      style: kRalewayMedium.copyWith(color: kBlue),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! / 3,
                ),
                Column(children: [
                  Text(
                    'I hope my design provides best user experience by',
                    style: kRalewayRegular.copyWith(color: kBlue),
                  ),
                  Text(
                    'Maintaining Class And Professionalism In UI Design.',
                    style: kRalewayMedium.copyWith(color: kBlue),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
