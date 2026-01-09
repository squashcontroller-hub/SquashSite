import 'package:flutter/material.dart';
import '../../views/home/FriendsPage.dart';
import '../../views/home/SchedulePage.dart';
import '../../views/home/main_home_view.desktop.dart';
import 'NavItems/NavPage.dart';
import 'MainNavigationBar.dart';


class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  NavPage _currentPage = NavPage.dashboard;

  void _onNavigate(NavPage page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget _buildPage() {
    switch (_currentPage) {
      case NavPage.schedule:
        return const SchedulePage();
      case NavPage.friends:
        return FriendsPage();
      case NavPage.profile:
        return const Center(child: Text('Profile'));
      case NavPage.dashboard:
        return const MainHomeViewDesktop();

      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          MainNavigationBar(
            currentPage: _currentPage,
            onNavigate: _onNavigate,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _buildPage(),
            ),
          ),
        ],
      ),
    );
  }
}
