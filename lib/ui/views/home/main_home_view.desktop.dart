import 'package:flutter/material.dart';
import 'package:squashwebsite/ui/common/app_constants.dart';
import 'home_view.desktop.dart';

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

class _MainHomeViewDesktopState extends State<MainHomeViewDesktop>
    with SingleTickerProviderStateMixin {

  late final AnimationController _avatarController;



  @override
  void initState() {
    super.initState();
    _avatarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }

}
