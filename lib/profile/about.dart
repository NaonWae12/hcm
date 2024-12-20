import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm/components/text_style.dart';
import '../components/primary_container.dart';
import 'logout_tile.dart';

class About extends StatelessWidget {
  About({super.key});

  final List<Map<String, dynamic>> settingsItems = [
    {
      'icon': 'assets/icons/note_text_rounded.svg',
      'title': 'Privacy Policy',
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
          child: Column(
            children: [
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
                            height: 24.0,
                            width: 24.0,
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
                                builder: (context) => item['page'],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }),
                  const LogoutTile(),
                ],
              ),
            ],
          ),
        ),
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
