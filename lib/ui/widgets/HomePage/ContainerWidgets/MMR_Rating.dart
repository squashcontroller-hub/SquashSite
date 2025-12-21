import 'package:flutter/material.dart';

class MmrRating extends StatelessWidget {
  const MmrRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          // STARS
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < 4 ? Icons.star : Icons.star_border,
                size: 18,
                color: const Color(0xFFFACC15),
              );
            }),
          ),

          const SizedBox(width: 12),

          Container(
            width: 1,
            height: 24,
            color: const Color(0xFFE2E8F0),
          ),

          const SizedBox(width: 12),

          // MMR
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'MMR',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                ),
              ),
              SizedBox(height: 2),
              Text(
                '1650',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
