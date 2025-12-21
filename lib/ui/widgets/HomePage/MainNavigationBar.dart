import 'package:flutter/material.dart';

import 'NavItems/NavItem.dart';
import 'NavItems/NavPage.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  NavPage currentPage = NavPage.dashboard;

  void _navigate(NavPage page) {
    setState(() => currentPage = page);

    // TODO: Navigator / GoRouter
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Row(
        children: [
          // LOGO
          Row(
            children: const [
              Icon(Icons.emoji_events_outlined,
                  color: Color(0xFF16A34A), size: 30),
              SizedBox(width: 10),
              Text(
                'Squash Rating',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF16A34A),
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              NavItem(
                icon: Icons.home_outlined,
                label: 'Dashboard',
                isActive: currentPage == NavPage.dashboard,
                onTap: () => _navigate(NavPage.dashboard),
              ),
              const SizedBox(width: 8),
              NavItem(
                icon: Icons.calendar_today_outlined,
                label: 'Schedule',
                isActive: currentPage == NavPage.schedule,
                onTap: () => _navigate(NavPage.schedule),
              ),
              const SizedBox(width: 8),
              NavItem(
                icon: Icons.group_outlined,
                label: 'Friends',
                isActive: currentPage == NavPage.friends,
                onTap: () => _navigate(NavPage.friends),
              ),
              const SizedBox(width: 8),
              NavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                isActive: currentPage == NavPage.profile,
                onTap: () => _navigate(NavPage.profile),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
