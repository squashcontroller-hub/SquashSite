import 'package:flutter/material.dart';

import 'ContainerWidgets/RatingCard.dart';
import 'ContainerWidgets/RatingData.dart';

class RatingsContainer extends StatelessWidget {
  const RatingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ratings = [
      const RatingData(label: 'Skills', value: 8.5),
      const RatingData(label: 'Fair Play', value: 9.2),
      const RatingData(label: 'Tactics', value: 7.8),
      const RatingData(label: 'Stamina', value: 8.0),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Ratings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: ratings
                .map(
                  (rating) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: RatingCard(data: rating),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
