import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

class ContentActivity extends StatelessWidget {
  const ContentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            'Today',
            style: AppTextStyles.heading3_4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: PrimaryContainer(
              height: 68,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/attendance_check.svg'),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Attendence Check',
                          style: AppTextStyles.heading2_1,
                        ),
                        Row(
                          children: [
                            Text(
                              '07.23 AM',
                              style: AppTextStyles.heading3_4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '→',
                                style: AppTextStyles.heading3_4,
                              ),
                            ),
                            Text(
                              '05.12 PM',
                              style: AppTextStyles.heading3_4,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Yesterday',
            style: AppTextStyles.heading3_4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: PrimaryContainer(
              height: 68,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/attendance_check.svg'),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Attendence Check',
                          style: AppTextStyles.heading2_1,
                        ),
                        Row(
                          children: [
                            Text(
                              '07.23 AM',
                              style: AppTextStyles.heading3_4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '→',
                                style: AppTextStyles.heading3_4,
                              ),
                            ),
                            Text(
                              '05.12 PM',
                              style: AppTextStyles.heading3_4,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: PrimaryContainer(
              height: 68,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/payroll.svg'),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Payroll',
                          style: AppTextStyles.heading2_1,
                        ),
                        Text(
                          'September 2023',
                          style: AppTextStyles.heading3_4,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
