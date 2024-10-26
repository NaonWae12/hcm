import 'package:flutter/material.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

import '../components/custom_container_time.dart';

class BottomContent extends StatelessWidget {
  const BottomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: PrimaryContainer(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attendence Tracking',
                    style: AppTextStyles.heading1_1,
                  ),
                  Text(
                    'View all',
                    style: AppTextStyles.heading3,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          const SizedBox(
                            height: 60,
                            width: 60,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.lightBlueAccent,
                              child: ClipOval(
                                child: Image.asset('assets/Payroll.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: const Color(0xFFFFEBEA),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/Track_checkOut.png',
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brigette Whopper',
                            style: AppTextStyles.heading2_1,
                          ),
                          Text(
                            'Marketing Officer',
                            style: AppTextStyles.heading3_2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomContainerTime(
                    width: 75,
                    height: 30,
                    color: Colors.green[100],
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '05.13 PM',
                        style: AppTextStyles.smalBoldlLabel,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey[101],
              )
            ],
          ),
        ),
      ),
    );
  }
}
