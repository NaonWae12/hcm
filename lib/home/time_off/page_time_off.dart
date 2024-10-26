import 'package:flutter/material.dart';
import 'package:hcm/components/primary_button.dart';
import 'package:hcm/components/text_style.dart';

import 'bottom_content.dart';
import 'midle_content1.dart';
import 'midle_content2.dart';
import 'top_content.dart';

class PageTimeOff extends StatefulWidget {
  const PageTimeOff({super.key});

  @override
  State<PageTimeOff> createState() => _PageTimeOffState();
}

class _PageTimeOffState extends State<PageTimeOff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Text(
              'Time Off',
              style: AppTextStyles.heading1_1,
            ),
            const SizedBox(width: 40),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopContent(),
            const SizedBox(height: 10),
            const MidleContent1(),
            const SizedBox(height: 10),
            const MidleContent2(),
            const SizedBox(height: 10),
            const BottomContent(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: PrimaryButton(
                buttonHeight: 50,
                buttonWidth: MediaQuery.of(context).size.width,
                buttonText: 'Submit time off request',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
