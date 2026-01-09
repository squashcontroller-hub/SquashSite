import 'package:flutter/material.dart';

import '../../views/home/ProfilePage.dart';
import 'InputFields.dart';
import 'RatingBadge.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileTab activeTab;
  final ValueChanged<ProfileTab> onTabChanged;

  const ProfileHeader({
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Profile',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Track your performance and manage settings',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              RatingBadge(),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              TabButton(
                label: 'Statistics',
                isActive: activeTab == ProfileTab.statistics,
                onTap: () => onTabChanged(ProfileTab.statistics),
              ),
              const SizedBox(width: 12),
              TabButton(
                label: 'Settings',
                isActive: activeTab == ProfileTab.settings,
                onTap: () => onTabChanged(ProfileTab.settings),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
