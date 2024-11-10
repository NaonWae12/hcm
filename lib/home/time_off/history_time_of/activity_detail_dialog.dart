// activity_detail_dialog.dart

import 'package:flutter/material.dart';

class ActivityDetailDialog extends StatelessWidget {
  final Map<String, dynamic> activity;

  const ActivityDetailDialog({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(activity['description'] ?? 'Detail'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Start Date: ${activity['startDate'] ?? '-'}'),
          Text('End Date: ${activity['endDate'] ?? '-'}'),
          Text('Descriptions: ${activity['private_name'] ?? '-'}'),
          Text('Duration: ${activity['duration_display'] ?? '-'}'),
          // Add any other details you want to display here
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
