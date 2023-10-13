import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/Screens/OmUI/HomePage.dart';
import 'package:gdsc_ui_design/Screens/OmUI/MembersPage.dart';
import 'package:gdsc_ui_design/Screens/OmUI/RegisteredPage.dart';
import 'package:gdsc_ui_design/Screens/OmUI/schedule_info.dart';
import 'package:gdsc_ui_design/Screens/OmUI/sponsors_page.dart';
import 'package:gdsc_ui_design/utils/app_styles.dart';
import 'package:gdsc_ui_design/utils/size_config.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:gdsc_ui_design/Screens/OmUI/PricesScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ScreenHiddenDrawer> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'DU Hacks',
            baseStyle: kRalewayMedium,
            colorLineSelected: kBlue,
            selectedStyle: kRalewayMedium),
        HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Registered Events',
            baseStyle: kRalewayMedium,
            colorLineSelected: kBlue,
            selectedStyle: kRalewayMedium),
        RegisteredPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Members Page',
            baseStyle: kRalewayMedium,
            colorLineSelected: kBlue,
            selectedStyle: kRalewayMedium),
        MembersPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Prize Information',
            baseStyle: kRalewayMedium,
            colorLineSelected: kBlue,
            selectedStyle: kRalewayMedium),
        PrizePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Sponsors',
            baseStyle: kRalewayMedium,
            colorLineSelected: kBlue,
            selectedStyle: kRalewayMedium),
            SponserPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Schedule Information',
            baseStyle: kRalewayMedium,
            colorLineSelected: kBlue,
            selectedStyle: kRalewayMedium),
            ScheduleInfoPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return HiddenDrawerMenu(
      screens: pages,
      backgroundColorMenu: kBlue.withOpacity(0.2),
      initPositionSelected: 0,
      backgroundColorAppBar: kBlue,
      disableAppBarDefault: false,
      slidePercent: 50,
      actionsAppBar: [
        IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg?auto=compress&cs=tinysrgb&w=600'),
            ))
      ],
    );
  }
}
