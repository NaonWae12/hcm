import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

class ContentActivity extends StatelessWidget {
  const ContentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy
    final List<Map<String, dynamic>> activities = [
      {
        'date': 'Today',
        'type': 'attendance',
        'startTime': '07:23 AM',
        'endTime': '05:12 PM',
        'icon': 'assets/icons/attendance_check.svg',
        'description': 'Attendance Check',
      },
      {
        'date': 'Yesterday',
        'type': 'attendance',
        'startTime': '07:23 AM',
        'endTime': '05:12 PM',
        'icon': 'assets/icons/attendance_check.svg',
        'description': 'Attendance Check',
      },
      {
        'date': 'Yesterday',
        'type': 'payroll',
        'payrollDate': 'September 2023',
        'icon': 'assets/icons/payroll.svg',
        'description': 'Payroll',
      },
      {
        'date': 'Tuesday',
        'type': 'time_off',
        'reason': 'Grandfather has passed away',
        'icon': 'assets/icons/time_off.svg',
        'description': 'Time Off',
      },
      {
        'date': 'Wednesday',
        'type': 'attendance',
        'startTime': '08:00 AM',
        'endTime': '05:00 PM',
        'icon': 'assets/icons/attendance_check.svg',
        'description': 'Attendance Check',
      },
      {
        'date': '19 September 2024',
        'type': 'attendance',
        'startTime': '07:30 AM',
        'endTime': '05:15 PM',
        'icon': 'assets/icons/attendance_check.svg',
        'description': 'Attendance Check',
      },
      {
        'date': '19 September 2024',
        'type': 'payroll',
        'payrollDate': 'September 2024',
        'icon': 'assets/icons/payroll.svg',
        'description': 'Payroll',
      },
    ];

    String? lastDate; // Variable to store the last displayed date

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: activities.map((activity) {
            bool showDate = activity['date'] != lastDate;
            if (showDate) {
              lastDate = activity[
                  'date']; // Update lastDate when new date is displayed
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDate) ...[
                    Text(
                      activity['date'],
                      style: AppTextStyles.heading3_4,
                    ),
                    const SizedBox(height: 8),
                  ],
                  PrimaryContainer(
                    height: 68,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(activity['icon']),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                activity['description'],
                                style: AppTextStyles.heading2_1,
                              ),
                              if (activity['type'] == 'attendance')
                                Row(
                                  children: [
                                    Text(
                                      activity['startTime'],
                                      style: AppTextStyles.heading3_4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        '→',
                                        style: AppTextStyles.heading3_4,
                                      ),
                                    ),
                                    Text(
                                      activity['endTime'],
                                      style: AppTextStyles.heading3_4,
                                    ),
                                  ],
                                ),
                              if (activity['type'] == 'payroll')
                                Text(
                                  activity['payrollDate'],
                                  style: AppTextStyles.heading3_4,
                                ),
                              if (activity['type'] == 'time_off')
                                Text(
                                  activity['reason'],
                                  style: AppTextStyles.heading3_4,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
