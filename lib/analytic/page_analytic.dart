import 'package:flutter/material.dart';

import '../components/text_style.dart';
import 'bottom_content_analytic.dart';
import 'top_content_analytic.dart';

class PageAnalytic extends StatelessWidget {
  const PageAnalytic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Center(
          child: Text(
            'Analytics',
            style: AppTextStyles.heading1_1,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            TopContentAnalytic(),
            SizedBox(height: 20),
            BottomContentAnalytic()
          ],
        ),
      ),
    );
  }
}
