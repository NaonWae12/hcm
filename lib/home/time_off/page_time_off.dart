// ignore_for_file: avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hcm/components/primary_button.dart';
import 'package:hcm/components/text_style.dart';
import 'bottom_content.dart';
import 'package:http/http.dart' as http;
import 'history_time_of/page_history.dart';
import 'midle_content1.dart';
import 'midle_content2.dart';
import 'success_dialog.dart';
import 'top_content.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PageTimeOff extends StatefulWidget {
  const PageTimeOff({super.key});

  @override
  State<PageTimeOff> createState() => _PageTimeOffState();
}

class _PageTimeOffState extends State<PageTimeOff> {
  final GlobalKey<TopContentState> _topContentKey =
      GlobalKey<TopContentState>();
  final GlobalKey<MidleContent1State> _midleContent1Key =
      GlobalKey<MidleContent1State>();
  final GlobalKey<MidleContent2State> _midleContent2Key =
      GlobalKey<MidleContent2State>();
  PlatformFile? _selectedFile;

  void _onFileSelected(PlatformFile? file) {
    setState(() {
      _selectedFile = file;
    });
  }

  Future<void> submitTimeOffRequest() async {
    final holidayStatusId =
        _topContentKey.currentState?.selectedHolidayStatusId;
    final fromDate1 = _midleContent1Key.currentState?.fromDate1;
    final fromDate2 = _midleContent1Key.currentState?.fromDate2;
    final description = _midleContent2Key.currentState?.description;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final employeeId = prefs.getInt('employee_id');

    if (holidayStatusId == null || employeeId == null) {
      print(
          "Please select a category and ensure employee ID is loaded before submitting.");
      return;
    }

    final url = Uri.parse('https://jt-hcm.simise.id/api/hr.leave/create');
    final body = json.encode({
      'holiday_status_id': holidayStatusId,
      'employee_id': employeeId,
      "holiday_type": "employee",
      'request_date_from': fromDate1?.toIso8601String(),
      'request_date_to': fromDate2?.toIso8601String(),
      'name': description,
    });

    print('Sending request to API hr.leave/create with data: $body');

    try {
      final response = await http.post(
        url,
        headers: {
          'api-key': 'H2BSQUDSOEJXRLT0P2W1GLI9BSYGCQ08',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final createId = responseData['create_id'];

        if (createId != null) {
          print('API hr.leave/create successful, create_id: $createId');

          // Log additional information
          print('Response body from API hr.leave/create: ${response.body}');

          // Lanjutkan untuk mengunggah file
          await uploadFile(employeeId, createId);
          if (mounted) {
            await showSuccessDialog(
              context,
              'Your time off request has been successfully submitted!',
            );
          }
        } else {
          print('create_id not found in response.');
        }
      } else {
        print('Failed to submit request: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error submitting request: $e');
    }
  }

  Future<void> uploadFile(int employeeId, int createId) async {
    if (_selectedFile == null) {
      print('No file selected for upload.');
      return;
    }

    final fileBytes = await File(_selectedFile!.path!).readAsBytes();
    final encodedFile = base64Encode(fileBytes);

    final uploadUrl =
        Uri.parse('https://jt-hcm.simise.id/api/ir.attachment/create');
    final fileBody = json.encode({
      "name": _selectedFile!.name,
      "datas": encodedFile,
      "res_model": "hr.leave",
      "res_id": createId,
      "mimetype": _selectedFile!.extension,
    });

    print('Sending file to API ir.attachment/create with data: $fileBody');

    try {
      final response = await http.post(
        uploadUrl,
        headers: {
          'api-key': 'H2BSQUDSOEJXRLT0P2W1GLI9BSYGCQ08',
          'Content-Type': 'application/json',
        },
        body: fileBody,
      );

      if (response.statusCode == 200) {
        print('File uploaded successfully.');
      } else {
        print('Failed to upload file: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                'Time Off',
                style: AppTextStyles.heading1_1,
              ),
              const SizedBox(width: 40),
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Request'),
              Tab(text: 'History'),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TopContent(
                      key: _topContentKey, midleContentKey: _midleContent1Key),
                  const SizedBox(height: 10),
                  MidleContent1(key: _midleContent1Key),
                  const SizedBox(height: 10),
                  MidleContent2(key: _midleContent2Key),
                  const SizedBox(height: 10),
                  BottomContent(onFileSelected: _onFileSelected),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: PrimaryButton(
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width,
                      buttonText: 'Submit time off request',
                      onPressed: submitTimeOffRequest,
                    ),
                  ),
                ],
              ),
            ),
            const PageHistory(),
          ],
        ),
      ),
    );
  }
}
