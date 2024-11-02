// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm/components/colors.dart';
import 'package:hcm/components/primary_button.dart';
import 'package:hcm/components/text_style.dart';
import 'package:hcm/components/textfield_input.dart';
import 'package:hcm/components/textfield_pw.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../navbar.dart';

class ContentLogin extends StatefulWidget {
  const ContentLogin({super.key});

  @override
  State<ContentLogin> createState() => _ContentLoginState();
}

class _ContentLoginState extends State<ContentLogin> {
  final TextEditingController databaseController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final url = Uri.parse('https://hr.simise.id/api/login');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer H2BSQUDSOEJXRLT0P2W1GLI9BSYGCQ08',
        },
        body: jsonEncode({
          'db': databaseController.text,
          'login': usernameController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        final data = jsonDecode(response.body);
        // Proses data response jika login berhasil
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Navbar()),
        );
      } else {
        // Tampilkan pesan error jika login gagal
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Login Failed"),
            content: const Text("Please check your credentials and try again."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Tampilkan pesan error jika terjadi kesalahan koneksi
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("An error occurred. Please try again later."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          const Text(
              "Ensure that your account is associated with your company's email address to access our applications."),
          const SizedBox(height: 20),
          TextfieldInput(
            controller: databaseController,
            hintText: 'https://hr.simise.id',
            icon: "assets/icons/link.svg",
            svgColor: Colors.grey,
            borderSide: const BorderSide(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          TextfieldInput(
            controller: usernameController,
            hintText: 'Username',
            icon: const Icon(Icons.person, color: Colors.grey),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          TextfileldPw(
            controller: passwordController,
            icon: 'assets/icons/Lock_key.svg',
            hintText: 'Input your password',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          Align(
              alignment: Alignment.center,
              child: Text(
                'Forgot password?',
                style: AppTextStyles.heading2_1,
              )),
          const SizedBox(height: 15),
          PrimaryButton(
              buttonWidth: MediaQuery.of(context).size.width,
              buttonHeight: 50,
              buttonText: 'Sign In',
              onPressed: login),
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
