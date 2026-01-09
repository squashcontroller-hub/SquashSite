import 'package:flutter/material.dart';

import 'ContainerWidgets/PendingReviewsSection.dart';
import 'ContainerWidgets/QuickActionsSection.dart';
import 'ContainerWidgets/ScheduleSection.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1200;

        return Container(
          color: const Color(0xFFF6F8FB),
          padding: const EdgeInsets.all(16),
          child: isWide
              ? Row(
            children: const [
              Expanded(child: QuickActionsSection()),
              SizedBox(width: 16),
              Expanded(child: ScheduleSection()),
              SizedBox(width: 16),
              Expanded(child: PendingReviewsSection()),
            ],
          )
              : Column(
            children: const [
              QuickActionsSection(),
              SizedBox(height: 16),
              ScheduleSection(),
              SizedBox(height: 16),
              PendingReviewsSection(),
            ],
          ),
        );
      },
    );
  }
}
