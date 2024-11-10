import 'package:flutter/material.dart';
import 'package:hcm/components/primary_container.dart';

import '../components/text_style.dart';
// import 'calendar/page_calendar.dart';
import 'expense/page_expense.dart';
import 'payslip/page_payslip_pin.dart';
// import 'resign/page_resign_form.dart';
import 'time_off/page_time_off.dart';

class MidleContent extends StatelessWidget {
  const MidleContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Expense',
      'Payslip',
      // 'Counseling',
      'Time Off',
      // 'Calendar',
      'Overtime',
      // 'Resign',
      // 'Other',
    ];
    final List<String> imagePaths = [
      'assets/Payroll.png',
      'assets/Payslip.png',
      // 'assets/Counseling.png',
      'assets/Time Off.png',
      'assets/Overtime.png',
      // 'assets/Calendar.png',
      // 'assets/Resign.png',
      // 'assets/Other.png',
    ];
    final List<Widget> pages = [
      const PageExpense(),
      const PagePayslipPin(),
      // const SettingsPage3(),
      const PageTimeOff(),
      // const PageCalendar(),
      const SettingsPage6(),
      // const PageResignForm(),
      // const SettingsPage8(),
    ];
    const int itemCount = 4;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Wrap(
            spacing: 25, // Jarak horizontal antara item
            runSpacing: 10, // Jarak vertikal antara baris
            children: List.generate(itemCount, (index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pages[index]),
                      );
                    },
                    child: PrimaryContainer(
                      height: 56,
                      width: 56,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          imagePaths[index],
                          scale: 1.6,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    titles[index],
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading3_1,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class SettingsPage1 extends StatelessWidget {
  const SettingsPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page1')),
    );
  }
}

class SettingsPage2 extends StatelessWidget {
  const SettingsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page1')),
    );
  }
}

class SettingsPage3 extends StatelessWidget {
  const SettingsPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page1')),
    );
  }
}

// class SettingsPage4 extends StatelessWidget {
//   const SettingsPage4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: const Center(child: Text('Settings Page1')),
//     );
//   }
// }

// class SettingsPage5 extends StatelessWidget {
//   const SettingsPage5({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: const Center(child: Text('Settings Page1')),
//     );
//   }
// }

class SettingsPage6 extends StatelessWidget {
  const SettingsPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page1')),
    );
  }
}

// class SettingsPage7 extends StatelessWidget {
//   const SettingsPage7({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: const Center(child: Text('Settings Page1')),
//     );
//   }
// }

class SettingsPage8 extends StatelessWidget {
  const SettingsPage8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page1')),
    );
  }
}
