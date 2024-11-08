// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hcm/components/primary_button.dart';
import 'package:hcm/components/text_style.dart';
import 'package:hcm/components/textfield_input.dart';
import 'package:hcm/components/textfield_pw.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../custom_loading.dart';
import '../navbar.dart';

class ContentLogin extends StatefulWidget {
  const ContentLogin({super.key});

  @override
  State<ContentLogin> createState() => _ContentLoginState();
}

class _ContentLoginState extends State<ContentLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String databaseName = 'JT_HCM_STG';

  Future<void> login() async {
    // Log untuk menampilkan username dan database yang digunakan
    // print('Attempting login with username: ${usernameController.text}');
    // print('Database: $databaseName');

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CustomLoading(imagePath: 'assets/3.png'),
    );

    final url = Uri.parse(
        'https://jt-hcm.simise.id/api/login?db=$databaseName&login=${usernameController.text}&password=${passwordController.text}');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'db': databaseName,
          'login': usernameController.text,
          'password': passwordController.text,
        }),
      );

      // Log untuk menampilkan status code dan body response
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(
            'Decoded Data: $data'); // Log untuk menampilkan data yang di-decode

        if (data['status'] == 'success') {
          print(
              'Login successful. Session ID: ${data['session_id']}'); // Log untuk menampilkan session ID

          // Log user_id dan employee_id jika terdapat dalam response
          SharedPreferences prefs = await SharedPreferences.getInstance();

          if (data.containsKey('user_id')) {
            print('User ID: ${data['user_id']}');
            await prefs.setInt('user_id', data['user_id']); // Menyimpan user_id
          }

          if (data.containsKey('employee_id')) {
            print(
                'Employee ID: ${data['employee_id']}'); // Menampilkan employee_id
            await prefs.setInt(
                'employee_id',
                data[
                    'employee_id']); // Menyimpan employee_id di SharedPreferences
          }

          await prefs.setString('session_id', data['session_id']);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Navbar()),
          );
        } else {
          print(
              'Login failed. Message: ${data['message']}'); // Log jika login gagal
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Login Failed"),
              content: Text(data['message'] ??
                  "Please check your credentials and try again."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      } else {
        print(
            'Failed to connect. Status code: ${response.statusCode}'); // Log jika request gagal
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content:
                Text("Failed to connect. Status code: ${response.statusCode}"),
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
      print('An error occurred: $error'); // Log jika terjadi error
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
