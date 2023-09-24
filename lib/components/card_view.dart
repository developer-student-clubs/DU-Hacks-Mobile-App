import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/utils/app_styles.dart';
import 'package:gdsc_ui_design/utils/size_config.dart';

class CardView extends StatefulWidget {
  const CardView({super.key, required this.title});

  final String title;
  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/card_background.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: kRalewayBold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 7),
          ),
        ),
      ),
    );
  }
}
