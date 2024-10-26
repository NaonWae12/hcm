import 'package:flutter/material.dart';
import 'package:hcm/components/text_style.dart';

import 'calendar_widget.dart';
// import 'page_schedule_timeline.dart';

class PageCalendar extends StatelessWidget {
  const PageCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Text(
              'Calendar',
              style: AppTextStyles.heading1_1,
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CalendarWidget(),
              // SizedBox(height: 10),
              // Expanded(child: PageScheduleTimeline()),
            ],
          ),
        ),
      ),
    );
  }
}
