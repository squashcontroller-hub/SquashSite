import 'package:flutter/material.dart';

import 'InputFields.dart';

class RatingBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: cardDecoration(),
      child: Row(
        children: [
          Row(
            children: List.generate(
              5,
                  (index) => Icon(
                index < 4 ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('MMR', style: TextStyle(fontSize: 12, color: Colors.black)),
              Text(
                '1650',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
