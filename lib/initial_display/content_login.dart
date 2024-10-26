import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm/components/colors.dart';
import 'package:hcm/components/primary_button.dart';
import 'package:hcm/components/text_style.dart';
import 'package:hcm/components/textfield_input.dart';
import 'package:hcm/components/textfield_pw.dart';

import '../navbar.dart';

class ContentLogin extends StatelessWidget {
  const ContentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          const Text(
              "Ensure that your account is associated with your company's email address to access our applications."),
          const SizedBox(height: 20),
          const TextfieldInput(
            hintText: 'example@gmail.com',
            icon: 'assets/icons/mail.svg',
            borderSide: BorderSide(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const TextfileldPw(
              icon: 'assets/icons/Lock_key.svg',
              hintText: 'Input your password',
              obscureText: true),
          const SizedBox(height: 20),
          Align(
              alignment: Alignment.center,
              child: Text(
                'Forgot password?',
                style: AppTextStyles.heading2_1,
              )),
          const SizedBox(height: 15),
          PrimaryButton(
              buttonWidth: MediaQuery.of(context).size.width / 1,
              buttonHeight: 50,
              buttonText: 'Sign In',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Navbar(),
                  ),
                );
              }),
          const SizedBox(height: 30),
          const Row(
            children: [
              Flexible(child: Divider()),
              SizedBox(width: 5),
              Text('or continue'),
              SizedBox(width: 5),
              Flexible(child: Divider()),
            ],
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            buttonWidth: MediaQuery.of(context).size.width / 1,
            buttonHeight: 50,
            backgroundColor: AppColors.textLight2,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Navbar(),
                ),
              );
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset('assets/icons/link.svg'),
              const SizedBox(width: 2),
              const Text(
                "Sign in With Company's URL",
              )
            ]),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/attention.svg'),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: const Text(
                      "If you encounter issues, please contact your company's HR department for assistance.",
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
