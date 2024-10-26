import 'package:flutter/material.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

import '../components/textfield_input.dart';
import 'content_activity.dart';

class PageActivity extends StatelessWidget {
  const PageActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/appBar_bg_full.png', fit: BoxFit.cover),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Activity',
                  style: AppTextStyles.heading1_2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                        child: TextfieldInput(
                      hintText: 'Search your payslip, attendence...',
                      icon: Icon(Icons.search),
                    )),
                    const SizedBox(width: 8),
                    Container(
                      height: 48,
                      width: 48,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: PrimaryContainer(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: const ContentActivity(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
