import 'package:flutter/material.dart';
import 'package:hcm/components/primary_button.dart';
import 'package:hcm/components/text_style.dart';

class PageAttendance extends StatelessWidget {
  const PageAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'), fit: BoxFit.fill)),
          ),
          Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Text(
                    'Attendence Check',
                    style: AppTextStyles.heading1_1,
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Clock In',
                      style: AppTextStyles.heading2_4,
                    ),
                    Text(
                      '08.00 AM',
                      style: AppTextStyles.displayText,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/face_id.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Face Recognition',
                      style: AppTextStyles.displayText_2,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Text(
                        'Ensure you are currently at the office and in well-lit surroundings for optimal face recognition.',
                        style: AppTextStyles.heading2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ),
              PrimaryButton(
                buttonHeight: 48,
                buttonWidth: MediaQuery.of(context).size.width / 1.4,
                buttonText: 'Start Live Attendence',
                onPressed: () {},
              ),
              const SizedBox(height: 20)
            ],
          ),
        ],
      ),
    ));
  }
}
