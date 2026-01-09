import 'package:flutter/material.dart';

import '../../widgets/HomePage/ProfileHeader.dart';
import '../../widgets/HomePage/StatisticsView.dart';
import '../../widgets/SettingsView.dart';

enum ProfileTab { statistics, settings }

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileTab _activeTab = ProfileTab.statistics;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(
            activeTab: _activeTab,
            onTabChanged: (tab) {
              setState(() => _activeTab = tab);
            },
          ),
          const SizedBox(height: 24),
          _activeTab == ProfileTab.statistics
              ? const StatisticsView()
              : const SettingsView(),
        ],
      ),
    );
  }
}
