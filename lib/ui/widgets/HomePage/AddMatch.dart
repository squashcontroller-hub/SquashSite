import 'package:flutter/material.dart';

import 'ContainerWidgets/AddMatchBTN.dart';
import 'ContainerWidgets/MMR_Rating.dart';

class AddMatch extends StatelessWidget {
  const AddMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: const Color(0xFFF8FAFC),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LEFT TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Here's your squash dashboard",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),

          const Spacer(),

          // ADD MATCH BUTTON
          Addmatchbtn(),

          const SizedBox(width: 16),

          // RATING / MMR CARD
          MmrRating()
        ],
      ),
    );
  }
}
