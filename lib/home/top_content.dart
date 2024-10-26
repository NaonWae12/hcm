import 'package:flutter/material.dart';
import 'package:hcm/components/custom_choice_container.dart';
import 'package:hcm/components/secondary_container.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

class TopContent extends StatelessWidget {
  const TopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      borderRadius: BorderRadius.circular(24),
      width: MediaQuery.of(context).size.width / 1.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today’s Overview", style: AppTextStyles.heading2),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.menu_outlined))
                ],
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child:
                    Text('24 September 2023', style: AppTextStyles.heading1_1)),
            const SizedBox(height: 14),
            SecondaryContainer(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Clock In',
                            style: AppTextStyles.heading3,
                          ),
                          Text(
                            '08.00 AM',
                            style: AppTextStyles.displayText_2,
                          ),
                          CustomChoiceContainer(
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Done, at 07.58',
                                  style: AppTextStyles.smalBoldlLabel,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Clock Out', style: AppTextStyles.heading3),
                          Text('05.00 PM', style: AppTextStyles.displayText_2),
                          CustomChoiceContainer(
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'No yet',
                                  style: AppTextStyles.smalBoldlLabel_2,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
