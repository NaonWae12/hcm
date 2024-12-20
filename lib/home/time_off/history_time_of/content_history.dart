// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'activity_detail_dialog.dart';

class ContentHistory extends StatefulWidget {
  const ContentHistory({super.key});

  @override
  State<ContentHistory> createState() => _ContentHistoryState();
}

class _ContentHistoryState extends State<ContentHistory> {
  List<Map<String, dynamic>> activities = [];
  int? employeeId;

  @override
  void initState() {
    super.initState();
    _loadEmployeeId();
  }

  Future<void> _loadEmployeeId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      employeeId = prefs.getInt('employee_id');
    });

    // Call fetchActivities only if employeeId is available
    if (employeeId != null) {
      fetchActivities();
    } else {
      print("Employee ID not found.");
    }
  }

  Future<void> fetchActivities() async {
    if (employeeId == null) {
      print("Cannot fetch activities: employeeId is null.");
      return;
    }

    String apiUrl =
        "https://jt-hcm.simise.id/api/hr.leave/search?domain=[('employee_id','=',$employeeId)]&fields=['employee_id','holiday_status_id','name','date_from','date_to','duration_display','state']";

    final headers = {
      'api-key': 'H2BSQUDSOEJXRLT0P2W1GLI9BSYGCQ08',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        print("Full JSON data received: $jsonData");

        if (jsonData.containsKey('data') && jsonData['data'] != null) {
          setState(() {
            activities = (jsonData['data'] as List<dynamic>).map((activity) {
              final String startDate = _formatDate(activity['date_from']);
              final String endDate = _formatDate(activity['date_to']);

              return {
                'description': activity['holiday_status_id'][0]['name'] ??
                    'No Description',
                'startDate': startDate,
                'endDate': endDate,
                'private_name': activity['private_name'] ?? '-',
                'duration_display': activity['duration_display'] ?? '-',
              };
            }).toList();
          });
        } else {
          print("No 'data' found in response or 'data' is null.");
        }
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  String _formatDate(String dateTimeString) {
    try {
      final DateTime parsedDate = DateTime.parse(dateTimeString);
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      print("Error parsing date: $e");
      return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: activities.map((activity) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>
                      ActivityDetailDialog(activity: activity),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryContainer(
                      height: 68,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/time_off.svg'),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      activity['description'] ??
                                          'No Description',
                                      style: AppTextStyles.heading2_1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          activity['startDate'] ?? '-',
                                          style: AppTextStyles.heading3_3,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            '→',
                                            style: AppTextStyles.heading3_3,
                                          ),
                                        ),
                                        Text(
                                          activity['endDate'] ?? '-',
                                          style: AppTextStyles.heading3_3,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/green_done.png',
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
