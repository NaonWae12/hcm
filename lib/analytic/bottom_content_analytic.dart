// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm/components/primary_button.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

class BottomContentAnalytic extends StatelessWidget {
  const BottomContentAnalytic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: PrimaryButton(
            buttonWidth: MediaQuery.of(context).size.width / 1.4,
            buttonHeight: 50,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'September - Download',
                  style: AppTextStyles.heading2_1,
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(
                  'assets/icons/download.svg',
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Attendence Summary',
          style: AppTextStyles.heading2_1,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryContainer(
              width: MediaQuery.of(context).size.width / 2.3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text('Time spent', style: AppTextStyles.heading3_3),
                    Text('174 h', style: AppTextStyles.displayText_2),
                  ],
                ),
              ),
            ),
            PrimaryContainer(
              width: MediaQuery.of(context).size.width / 2.3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text('Avg. hour', style: AppTextStyles.heading3_3),
                    Text('8.2h', style: AppTextStyles.displayText_2),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
