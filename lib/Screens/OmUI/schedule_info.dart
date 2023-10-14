import 'dart:convert';
import 'package:gdsc_ui_design/utils/app_styles.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gdsc_ui_design/models/schedule_data_model%20.dart';

class ScheduleInfoPage extends StatefulWidget {
  const ScheduleInfoPage({super.key});

  @override
  State<ScheduleInfoPage> createState() => _ScheduleInfoPageState();
}

class _ScheduleInfoPageState extends State<ScheduleInfoPage> {
  late Future<ScheduleDataModel> scheduleData;

  @override
  void initState() {
    super.initState();
    // Fetch the schedule data when the widget is initialized
    scheduleData = fetchScheduleData();
  }

  Future<ScheduleDataModel> fetchScheduleData() async {
    final response = await http
        .get(Uri.parse('https://du-hacks-apis.vercel.app/api/v2/schedule'));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return ScheduleDataModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }

  void getData() async {
    try {
      ScheduleDataModel scheduleData = await fetchScheduleData();
      // Do something with the data
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ScheduleDataModel>(
      future: scheduleData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while the data is being fetched
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Show error message if there's an error fetching the data
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
          // Show a message if the data is empty
          return Text('No schedule data available.');
        } else {
          // Show the schedule data
          return ListView.builder(
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data!.data![index];
              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 4.0,
                shadowColor: kBlack0D.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: kLightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  padding: EdgeInsets.all(16.0),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBlack0D,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        item.description!,
                        style: TextStyle(
                          fontSize: 14,
                          color: kBlack0D,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(Icons.date_range, color: kBlack0D),
                          SizedBox(width: 4.0),
                          Text(
                            item.date!,
                            style: TextStyle(
                              fontSize: 14,
                              color: kBlack0D,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Icon(Icons.access_time, color: kBlack0D),
                          SizedBox(width: 4.0),
                          Text(
                            item.time!,
                            style: TextStyle(
                              fontSize: 14,
                              color: kBlack0D,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
