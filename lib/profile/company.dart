import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/primary_container.dart';
import '../components/text_style.dart';

class Company extends StatelessWidget {
  Company({super.key});
  final List<Map<String, dynamic>> settingsItems = [
    {
      'icon': 'assets/icons/case_rounded.svg',
      'title': 'My Company',
      'page': const AccountSettingsPage(),
    },
    {
      'icon': 'assets/icons/widget_rounded.svg',
      'title': 'Structure',
      'page': const NotificationSettingsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: PrimaryContainer(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Column(
              children: [
                ...settingsItems.map((item) {
                  return Column(
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          item['icon'],
                          // ignore: deprecated_member_use
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(
                          item['title'],
                          style: AppTextStyles.heading2_4,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => item['page']),
                          );
                        },
                      ),
                    ],
                  );
                })
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: const Center(
        child: Text('Account Settings Page'),
      ),
    );
  }
}

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: const Center(
        child: Text('Notification Settings Page'),
      ),
    );
  }
}
