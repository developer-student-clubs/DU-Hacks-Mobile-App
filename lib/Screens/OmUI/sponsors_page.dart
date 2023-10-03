import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/utils/app_styles.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/size_config.dart';

class Sponsor {
  final String name;
  final String description;
  final String logoUrl;
  final String website;
  final List<String> rewards;

  Sponsor({
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.website,
    required this.rewards,
  });
}

class SponserPage extends StatefulWidget {
  const SponserPage({super.key});

  @override
  State<SponserPage> createState() => _SponserPageState();
}

class _SponserPageState extends State<SponserPage> {
  Future<List<Sponsor>> fetchData() async {
    final response = await http.get(
      Uri.parse('https://du-hacks-apis.vercel.app/api/v2/sponsors'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final dataList = jsonData['data'];

      return dataList
          .map<Sponsor>((data) => Sponsor(
                name: data['name'],
                description: data['description'],
                logoUrl: data['logoUrl'],
                website: data['website'],
                rewards: List<String>.from(data['rewards']),
              ))
          .toList();
    } else {
      throw Exception('Failed to load sponsors: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Sponsor>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Show a loading indicator
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final sponsors = snapshot.data;

            return ListView.builder(
              itemCount: sponsors!.length,
              itemBuilder: (context, index) {
                final sponsor = sponsors[index];

                return SponsorCard(sponsor: sponsor);
              },
            );
          }
        },
      ),
    );
  }
}

class SponsorCard extends StatefulWidget {
  const SponsorCard({super.key, required this.sponsor});
  final Sponsor sponsor;

  @override
  State<SponsorCard> createState() => _SponsorCardState();
}

class _SponsorCardState extends State<SponsorCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Color.fromARGB(255, 138, 167, 243),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin:
                        Alignment.topCenter, // Align the gradient from the top
                    end: Alignment.bottomCenter, // To the bottom
                    colors: [
                      Color.fromARGB(255, 254, 254, 255),
                      Color.fromARGB(255, 94, 139, 252),
                    ], // Add your two desired colors
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        // widget.sponsor.logoUrl
                        "https://altcoinsbox.com/wp-content/uploads/2023/03/matic-logo-350x350.webp",
                      ),
                      radius: 50, // Increased image size
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.sponsor.name,
                            style: kRalewaySemibold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 7,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            widget.sponsor.description,
                            style: kRalewaySemibold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: isExpanded ? null : 0,
                child: isExpanded
                    ? Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment
                                .topCenter, // Align the gradient from the top
                            end: Alignment.bottomCenter, // To the bottom
                            colors: [
                              Color.fromARGB(255, 99, 142, 250),
                              Color.fromARGB(255, 94, 138, 248),
                              Color.fromARGB(255, 94, 138, 248),
                              Color.fromARGB(255, 89, 135, 251),
                              Color.fromARGB(255, 55, 111, 253),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Rewards:',
                              style: TextStyle(
                                fontSize: 22, // Increased font size
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widget.sponsor.rewards
                                  .map((reward) => Text(
                                        reward,
                                        textAlign: TextAlign.left,
                                        style: kRalewaySemibold.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  4.5,
                                        ),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 7, 47, 125)),
                              onPressed: () {
                                print(widget.sponsor.website);
                                _launchURL(widget.sponsor.website);
                              },
                              // onPressed: _launchURL(widget.sponsor.website),
                              child: Text(
                                'Visit Website',
                                style: kRalewaySemibold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _launchURL(String url) async {
  //   print(url);
  //   // ADD Launcher Code Here
  //   if (await canLaunchUrl(uri!)) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw 'Could not launch $url';
  //   }

  // }
  Future<void> _launchURL(String url) async {
  //   final Uri? uri = Uri.tryParse(url);
  //   print(uri);
  //   if (!await launchUrl(uri!)) {
  //     throw Exception('Could not launch $uri');
  //   }
  }
}
