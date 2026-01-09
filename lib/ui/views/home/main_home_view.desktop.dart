import 'package:flutter/material.dart';
import 'package:squashwebsite/ui/common/app_constants.dart';
import 'package:squashwebsite/ui/widgets/HomePage/NavItems/NavPage.dart';

import '../../widgets/HomePage/AddMatch.dart';
import '../../widgets/HomePage/ContainerWithInfo.dart';
import '../../widgets/HomePage/MainContainer.dart';
import '../../widgets/HomePage/MainNavigationBar.dart';
import '../../widgets/HomePage/RatingsContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const primary = Color(0xFF0E5181);
  static const secondary = Color(0xFF1A1A1A);
  static const accent = Color(0xFF99CC33);

  @override
  Widget build(BuildContext context) {
    return MainHomeViewDesktop();
  }
}


class MainHomeViewDesktop extends StatefulWidget {
  const MainHomeViewDesktop({super.key});

  @override
  State<MainHomeViewDesktop> createState() => _MainHomeViewDesktopState();
}

class _MainHomeViewDesktopState extends State<MainHomeViewDesktop> {
  NavPage _currentPage = NavPage.dashboard;

  void _onNavigate(NavPage page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [

        AddMatch(),

        ContainerWithInfo(),

        MainContainer(),

        RatingsContainer()

      ])
    );
  }

}

