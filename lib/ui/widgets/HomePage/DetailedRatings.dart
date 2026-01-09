import 'package:flutter/material.dart';

import 'InputFields.dart';
import 'RatingBar.dart';

class DetailedRatings extends StatelessWidget {
  const DetailedRatings();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Detailed Ratings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 24),
          RatingBar(label: 'Skills', value: 8.5, color: Colors.blue),
          RatingBar(label: 'Fair Play', value: 9.2, color: Colors.green),
          RatingBar(label: 'Tactics/Positioning', value: 7.8, color: Colors.purple),
          RatingBar(label: 'Stamina', value: 8.0, color: Colors.orange),
        ],
      ),
    );
  }
}
