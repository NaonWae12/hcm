// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hcm/components/colors.dart';
import 'package:hcm/components/text_style.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'custom_dialog.dart';

class PageAttendance extends StatefulWidget {
  const PageAttendance({super.key});

  @override
  State<PageAttendance> createState() => _PageAttendanceState();
}

class _PageAttendanceState extends State<PageAttendance> {
  late int employeeId;
  late String currentCheckInTime;
  bool hasCheckedIn = false;
  bool showCheckOutButton = false;

  @override
  void initState() {
    super.initState();
    _loadEmployeeId();
    _setCurrentCheckInTime();
    _loadCheckInStatus();
  }

  Future<void> _loadEmployeeId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      employeeId = prefs.getInt('employee_id') ?? 0;
    });
  }

  Future<void> _loadCheckInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final checkInTime = prefs.getString('check_in_time');
    if (checkInTime != null) {
      setState(() {
        currentCheckInTime = checkInTime;
        hasCheckedIn = true;
      });
      // Tampilkan tombol check-out setelah delay jika sudah check-in
      _delayedShowCheckOutButton();
    } else {
      _setCurrentCheckInTime();
    }
  }

  void _setCurrentCheckInTime() {
    final now = DateTime.now();
    currentCheckInTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
  }

  Future<void> _checkIn() async {
    final now = DateTime.now();
    final formattedCheckInTime =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('check_in_time', formattedCheckInTime);

    setState(() {
      currentCheckInTime = formattedCheckInTime;
      hasCheckedIn = true;
    });

    // Tampilkan dialog untuk check-in
    await showCheckInDialog(context,
        "Anda telah berhasil check-in! Selamat bekerja dan semoga hari ini penuh produktivitas!");

    // Tampilkan tombol check-out setelah delay 5 detik
    _delayedShowCheckOutButton();
  }

  Future<void> _checkOut() async {
    final now = DateTime.now();
    final checkOutTime =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final checkInTime = prefs.getString('check_in_time');

    final url = Uri.parse('https://jt-hcm.simise.id/api/hr.attendance/create');
    final headers = {
      "Content-Type": "application/json",
      'api-key': 'H2BSQUDSOEJXRLT0P2W1GLI9BSYGCQ08',
    };
    final body = jsonEncode({
      "employee_id": employeeId,
      "check_in": checkInTime,
      "check_out": checkOutTime,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        await prefs.remove('check_in_time');
        setState(() {
          hasCheckedIn = false;
          showCheckOutButton = false;
        });
        await showCheckOutDialog(context,
            "Anda telah berhasil check-out! Selamat beristirahat. Terima kasih atas kerja keras Anda hari ini!");
      } else {
        await showDialog1(context, "Gagal mengirim absensi");
      }
    } catch (e) {
      await showDialog1(context, "Terjadi kesalahan pada jaringan");
    }
  }

  void _delayedShowCheckOutButton() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          showCheckOutButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg.png'), fit: BoxFit.fill)),
            ),
            Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    Text(
                      'Attendance Check',
                      style: AppTextStyles.heading1_1,
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Clock In',
                        style: AppTextStyles.heading2_4,
                      ),
                      Text(
                        currentCheckInTime,
                        style: AppTextStyles.displayText,
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/face_id.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Your Attendance',
                        style: AppTextStyles.displayText_2,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Text(
                          "Good morning, team! Don't forget to fill in your daily attendance.",
                          style: AppTextStyles.heading2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  child: Column(
                    children: [
                      if (!hasCheckedIn)
                        SlideAction(
                          onSubmit: () async {
                            await _checkIn();
                          },
                          innerColor: AppColors.textColor1,
                          outerColor: AppColors.primaryColor,
                          text: 'Swipe right to clock in',
                          textStyle: AppTextStyles.heading2,
                        ),
                      if (hasCheckedIn && showCheckOutButton)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: SlideAction(
                            onSubmit: () async {
                              await _checkOut();
                            },
                            innerColor: Colors.red,
                            outerColor: AppColors.primaryColor,
                            text: 'Swipe right to clock out',
                            textStyle: AppTextStyles.heading2,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
