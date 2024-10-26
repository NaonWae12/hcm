import 'package:flutter/material.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

import 'date_picker_field.dart';
import 'time_selector.dart';

class MidleContent1 extends StatefulWidget {
  const MidleContent1({super.key});

  @override
  State<MidleContent1> createState() => _MidleContent1State();
}

class _MidleContent1State extends State<MidleContent1> {
  DateTime? _fromDate;
  Future<void> selectDate(BuildContext context, DateTime? initialDate,
      ValueChanged<DateTime?> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      borderRadius: BorderRadius.circular(0),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set the duration',
              style: AppTextStyles.heading2_1,
            ),
            Text(
              'Start date',
              style: AppTextStyles.heading2_1,
            ),
            const SizedBox(height: 10),
            DatePickerField(
              label: 'Select date',
              selectedDate: _fromDate,
              onDateSelected: (newDate) {
                setState(() {
                  _fromDate = newDate;
                });
              },
            ),
            const SizedBox(height: 8),
            const TimeSelector()
          ],
        ),
      ),
    );
  }
}
