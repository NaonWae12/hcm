import 'package:flutter/material.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

class TopContentAnalytic extends StatefulWidget {
  const TopContentAnalytic({super.key});

  @override
  State<TopContentAnalytic> createState() => _TopContentAnalyticState();
}

class _TopContentAnalyticState extends State<TopContentAnalytic> {
  String selectedMonth = 'September 2023'; // Default selected value
  final List<String> months = [
    'September 2023',
    'October 2023',
    'November 2023'
  ];

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Monthly Accumulation',
                  style: AppTextStyles.heading3_1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.40,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      value: selectedMonth,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down),
                      isExpanded: true, // Ensure the dropdown takes full width
                      style: AppTextStyles.heading3_6(context),
                      dropdownColor: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMonth = newValue!;
                        });
                      },
                      items:
                          months.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Presence', style: AppTextStyles.heading3_3),
                    Text('23', style: AppTextStyles.displayText_2)
                  ],
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.grey[350],
                ),
                Column(
                  children: [
                    Text('Absence', style: AppTextStyles.heading3_3),
                    Text('0', style: AppTextStyles.displayText_2)
                  ],
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.grey[350],
                ),
                Column(
                  children: [
                    Text('Late', style: AppTextStyles.heading3_3),
                    Text('1.2h', style: AppTextStyles.displayText_2)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
