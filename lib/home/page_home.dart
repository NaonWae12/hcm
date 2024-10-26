import 'package:flutter/material.dart';
import 'package:hcm/components/text_style.dart';

import 'bottom_content.dart';
import 'midle_content.dart';
import 'top_content.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marketing Officer,',
                  style: AppTextStyles.heading3_2,
                ),
                Text(
                  'Mike Cooper',
                  style: AppTextStyles.heading2_3,
                ),
              ],
            ),
            leading: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 32,
            ),
            flexibleSpace: Image.asset(
              'assets/appBar_bg1.png',
              fit: BoxFit.fill,
            )),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              'assets/appBar_bg2.png',
              fit: BoxFit.cover,
            ),
            const SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 30),
                  TopContent(),
                  SizedBox(height: 20),
                  MidleContent(),
                  SizedBox(height: 10),
                  BottomContent(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
