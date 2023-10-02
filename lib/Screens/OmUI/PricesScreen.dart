import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/utils/app_styles.dart';
import 'package:gdsc_ui_design/utils/size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrizePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Prize>>(
        future: fetchPrizes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<Prize> prizes = snapshot.data!;
            return PrizeCardList(prizes: prizes);
          } else {
            return Text('No data available.');
          }
        },
      ),
    );
  }
}

class Prize {
  final String title;
  final List<String> rewards;

  Prize({required this.title, required this.rewards});

  factory Prize.fromJson(Map<String, dynamic> json) {
    return Prize(
      title: json['title'],
      rewards: List<String>.from(json['rewards']),
    );
  }
}

Future<List<Prize>> fetchPrizes() async {
  final response = await http
      .get(Uri.parse('https://du-hacks-apis.vercel.app/api/v2/prizes/'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)['data'];

    if (data is List) {
      List<Prize> prizes = data.map((json) => Prize.fromJson(json)).toList();
      return prizes;
    } else {
      throw Exception('API response data is not a list.');
    }
  } else {
    throw Exception('Failed to fetch prizes');
  }
}

class PrizeCardList extends StatelessWidget {
  final List<Prize> prizes;

  PrizeCardList({required this.prizes});

  static const List<String> trophy = [
    'assets/images/first-prize-trophy.jpg',
    'assets/images/second-prize-trophy.jpg',
    'assets/images/third-prize-trophy.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prizes.length,
      itemBuilder: (context, index) {
        return PrizeCard(
          title: prizes[index].title,
          rewards: prizes[index].rewards,
          glowColor: prizes[index].title == "First Prize"
              ? Color(0xFFFFD700)
              : (prizes[index].title == "Second Prize"
                  ? Color(0xFFC0C0C0)
                  : Color(0xFFCD7F32)),
          trophyImage: prizes[index].title == "First Prize"
              ? trophy[0]
              : (prizes[index].title == "Second Prize" ? trophy[1] : trophy[2]),
        );
      },
    );
  }
}

class PrizeCard extends StatelessWidget {
  final String title;
  final List<String> rewards;
  final Color glowColor;
  final String trophyImage;

  PrizeCard({
    required this.title,
    required this.rewards,
    required this.glowColor,
    required this.trophyImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(kPadding16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        color: glowColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: kRalewaySemibold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 5,
              ),
            ),
          ),
          Image.asset(
            trophyImage,
            height: 100,
            width: 100,
          ),
          for (String reward in rewards)
            Container(
              padding: EdgeInsets.all(kPadding8),
              child: Text(
                reward,
                style: kRalewaySemibold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
