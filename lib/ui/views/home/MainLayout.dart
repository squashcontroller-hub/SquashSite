import 'package:flutter/material.dart';
import 'package:squashwebsite/ui/widgets/HomePage/HomeShell.dart';

import '../../widgets/HomePage/MainNavigationBar.dart';
import '../../widgets/HomePage/NavItems/NavPage.dart';
import 'SchedulePage.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  NavPage currentPage = NavPage.dashboard;

  void onNavigate(NavPage page) {
    setState(() => currentPage = page);
  }

  Widget _buildPage() {
    switch (currentPage) {
      case NavPage.schedule:
        return const SchedulePage();
      case NavPage.friends:
        return const Center(child: Text('Friends'));
      case NavPage.profile:
        return const Center(child: Text('Profile'));
      case NavPage.dashboard:
      default:
        return const HomeShell();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          MainNavigationBar(
            currentPage: currentPage,
            onNavigate: onNavigate,
          ),
          Expanded(child: _buildPage()),
        ],
      ),
    );
  }
}
