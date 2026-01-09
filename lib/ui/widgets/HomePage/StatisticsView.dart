import 'package:flutter/material.dart';

import 'ContainerWidgets/StatCard.dart';
import 'DetailedRatings.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:  [
            Expanded(
              child: StatCard(
                title: 'MMR Rating',
                value: '1650',
                iconColor: Colors.green,
                icon: Icons.emoji_events,
                iconBg: Colors.green.shade800,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: StatCard(
                title: 'Star Rating',
                value: '4 / 5 Stars',
                iconColor: Colors.blue,
                icon: Icons.star,
                iconBg: Colors.blue.shade800,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: StatCard(
                title: 'Average Rating',
                value: '8.38 / 10',
                iconColor: Colors.purple,
                iconBg: Colors.purple.withOpacity(0.1),
                icon: Icons.trending_up,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const DetailedRatings(),
      ],
    );
  }
}
