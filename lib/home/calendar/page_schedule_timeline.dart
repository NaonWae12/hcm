import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';
import 'task_detail_dialog.dart'; // Import TaskDetailDialog

class PageScheduleTimeline extends StatelessWidget {
  const PageScheduleTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Timeline'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TimePlanner(
          startHour: 7, // Jam mulai tampilan planner
          endHour: 20, // Jam akhir tampilan planner
          headers: const [
            TimePlannerTitle(
              title: 'Monday',
              titleStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            TimePlannerTitle(
              title: 'Tuesday',
              titleStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            TimePlannerTitle(
              title: 'Wednesday',
              titleStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            TimePlannerTitle(
              title: 'Thursday',
              titleStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            TimePlannerTitle(
              title: 'Friday',
              titleStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
          tasks: [
            TimePlannerTask(
              color: Colors.blueAccent,
              dateTime: TimePlannerDateTime(day: 0, hour: 8, minutes: 0),
              minutesDuration: 60,
              child: InkWell(
                onTap: () {
                  // Menampilkan dialog ketika task ditekan
                  showDialog(
                    context: context,
                    builder: (context) => const TaskDetailDialog(
                      title: 'Task 1',
                      date: '2024-10-17 10:00',
                      description: 'This is the detail of Task 1.',
                      color: Colors.blueAccent,
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Task 1', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5),
                    Text('2024-10-17 10:00',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
            TimePlannerTask(
              color: Colors.blueAccent,
              dateTime: TimePlannerDateTime(day: 0, hour: 8, minutes: 0),
              minutesDuration: 60,
              child: InkWell(
                onTap: () {
                  // Menampilkan dialog ketika task ditekan
                  showDialog(
                    context: context,
                    builder: (context) => const TaskDetailDialog(
                      title: 'Task 1',
                      date: '2024-10-17 10:00',
                      description: 'This is the detail of Task 1.',
                      color: Colors.orangeAccent,
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Task 1.1', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5),
                    Text('2024-10-17 10:00',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
            TimePlannerTask(
              color: Colors.greenAccent,
              dateTime: TimePlannerDateTime(day: 1, hour: 12, minutes: 30),
              minutesDuration: 90,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const TaskDetailDialog(
                      title: 'Task 2',
                      date: '2024-10-18 12:30',
                      description: 'This is the detail of Task 2.',
                      color: Colors.greenAccent,
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Task 2', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5),
                    Text('2024-10-18 12:30',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
            TimePlannerTask(
              color: Colors.redAccent,
              dateTime: TimePlannerDateTime(day: 2, hour: 14, minutes: 0),
              minutesDuration: 120,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const TaskDetailDialog(
                      title: 'Task 3',
                      date: '2024-10-19 14:00',
                      description: 'This is the detail of Task 3.',
                      color: Colors.redAccent,
                    ),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Task 3', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5),
                    Text('2024-10-19 14:00',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
