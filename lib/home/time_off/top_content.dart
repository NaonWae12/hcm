// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../components/primary_container.dart';
import '../../components/text_style.dart';

class TopContent extends StatefulWidget {
  const TopContent({super.key});

  @override
  State<TopContent> createState() => _TopContentState();
}

class _TopContentState extends State<TopContent> {
  String selectedCategory = '';
  List<String> categories = [];
  int? employeeId;

  @override
  void initState() {
    super.initState();
    _loadEmployeeId();
    fetchCategories();
  }

  Future<void> _loadEmployeeId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      employeeId = prefs.getInt('employee_id');
    });
    if (employeeId != null) {
      fetchCategories(); // Panggil fetchCategories setelah employeeId terisi
    } else {
      print('Employee ID not found in SharedPreferences');
    }
  }

  Future<void> fetchCategories() async {
    final url = Uri.parse(
        'https://jt-hcm.simise.id/api/hr/leave/allocation?employee_id=$employeeId');

    try {
      final response = await http.get(
        url,
        headers: {
          'api-key': 'H2BSQUDSOEJXRLT0P2W1GLI9BSYGCQ08',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic>? categoriesData = data['holiday_status'];

        if (categoriesData != null) {
          setState(() {
            categories =
                categoriesData.map((item) => item['name'] as String).toList();
            if (categories.isNotEmpty) {
              selectedCategory =
                  categories[0]; // Set default to the first category
            }
          });
        } else {
          print('holiday_status is null or not a list');
        }
      } else {
        print('Failed to load categories, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      borderRadius: BorderRadius.circular(0),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Time Off Type',
              style: AppTextStyles.heading2_1,
            ),
            const SizedBox(height: 8),
            categories.isEmpty
                ? const CircularProgressIndicator()
                : DropdownButton<String>(
                    value: selectedCategory.isEmpty ? null : selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: categories
                        .map<DropdownMenuItem<String>>((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(
                          category,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                    dropdownColor: Theme.of(context).colorScheme.surface,
                  ),
          ],
        ),
      ),
    );
  }
}
