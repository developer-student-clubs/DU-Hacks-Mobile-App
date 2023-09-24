import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/components/card_view.dart';
import 'package:gdsc_ui_design/utils/app_styles.dart';
import 'package:gdsc_ui_design/utils/size_config.dart';

class UIChallenge extends StatefulWidget {
  const UIChallenge({super.key});

  @override
  State<UIChallenge> createState() => _UIChallengeState();
}

class _UIChallengeState extends State<UIChallenge> {
  int _selectedIndex = 0;

  final List _pages = [
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Events (2)',
              style: kRalewayMedium.copyWith(
                color: kBlack,
                fontSize: SizeConfig.blockSizeHorizontal! * 6,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CardView(title: "DSC - DDU"),
            const CardView(title: "DSC - DDU"),
            SizedBox(
              height: 10,
            ),
            Text(
              'Past Events (5)',
              style: kRalewayMedium.copyWith(
                color: kBlack,
                fontSize: SizeConfig.blockSizeHorizontal! * 6,
              ),
            ),
          ],
        ),
      ),
    ),
    const Center(
      child: Text('Registered Events'),
    ),
    const Center(
      child: Text('Members'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color themeColor = Color.fromRGBO(153, 50, 216, 0.81);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: themeColor,
            leadingWidth: 80,
            leading: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 17),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  "https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg?auto=compress&cs=tinysrgb&w=600",
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              'DSC DDU',
              style: kRalewayBold.copyWith(
                  color: kWhite, fontSize: SizeConfig.blockSizeHorizontal! * 8),
            ),
            centerTitle: true,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_rounded),
              label: 'Registered Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Members',
            ),
          ],
          currentIndex: _selectedIndex, //New
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          fixedColor: themeColor,
          selectedLabelStyle: kRalewayBold.copyWith(color: themeColor),
          selectedFontSize: SizeConfig.blockSizeHorizontal! * 4,
          selectedIconTheme: IconThemeData(
              color: themeColor, size: SizeConfig.blockSizeHorizontal! * 10),
        ),
        body: _pages[_selectedIndex]);
  }
}
