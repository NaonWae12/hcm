import 'package:flutter/material.dart';
import 'package:hcm/components/primary_container.dart';
import 'package:hcm/components/text_style.dart';

import 'content_login.dart';

class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/appBar_bg_full.png', fit: BoxFit.cover),
          Column(
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome Back!',
                style: AppTextStyles.heading1_2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.25,
                child: Text(
                  "Let’s get you sign in and we will make your work life smoother, together.",
                  style: AppTextStyles.heading3_3,
                  textAlign: TextAlign.center,
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
                  child: const ContentLogin(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
