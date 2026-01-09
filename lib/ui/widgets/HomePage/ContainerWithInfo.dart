import 'package:flutter/material.dart';

import 'ContainerWidgets/StarRatingCard.dart';
import 'ContainerWidgets/StatCard.dart';

class ContainerWithInfo extends StatelessWidget {
  const ContainerWithInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1100;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: isWide
              ? Row(
            children: const [
              Expanded(
                child: StatCard(
                  icon: Icons.emoji_events_outlined,
                  iconBg: Color(0xFFD1FAE5),
                  iconColor: Color(0xFF059669),
                  title: 'MMR',
                  value: '1650',
                ),
              ),
              SizedBox(width: 16),
              Expanded(child: StarRatingCard()),
              SizedBox(width: 16),
              Expanded(
                child: StatCard(
                  icon: Icons.calendar_today_outlined,
                  iconBg: Color(0xFFEDE9FE),
                  iconColor: Color(0xFF7C3AED),
                  title: 'Upcoming',
                  value: '4 matches',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: StatCard(
                  icon: Icons.error_outline,
                  iconBg: Color(0xFFFFEDD5),
                  iconColor: Color(0xFFEA580C),
                  title: 'Pending Reviews',
                  value: '2',
                ),
              ),
            ],
          )
              : Column(
            children: const [
              StatCard(
                icon: Icons.emoji_events_outlined,
                iconBg: Color(0xFFD1FAE5),
                iconColor: Color(0xFF059669),
                title: 'MMR',
                value: '1650',
              ),
              SizedBox(height: 16),
              StarRatingCard(),
              SizedBox(height: 16),
              StatCard(
                icon: Icons.calendar_today_outlined,
                iconBg: Color(0xFFEDE9FE),
                iconColor: Color(0xFF7C3AED),
                title: 'Upcoming',
                value: '4 matches',
              ),
              SizedBox(height: 16),
              StatCard(
                icon: Icons.error_outline,
                iconBg: Color(0xFFFFEDD5),
                iconColor: Color(0xFFEA580C),
                title: 'Pending Reviews',
                value: '2',
              ),
            ],
          ),
        );
      },
    );
  }
}
