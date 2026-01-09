import 'package:flutter/material.dart';

import 'SectionCard.dart';

class PendingReviewsSection extends StatelessWidget {
  const PendingReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "Pending Reviews",
      trailing: const Icon(Icons.warning_amber_rounded,
          color: Colors.orange, size: 20),
      child: Column(
        children: const [
          PendingReviewItem(
            name: "Alex Johnson",
            date: "Dec 14",
            score: "3-1",
          ),
          SizedBox(height: 12),
          PendingReviewItem(
            name: "Maria Garcia",
            date: "Dec 13",
            score: "2-3",
          ),
        ],
      ),
    );
  }
}

class PendingReviewItem extends StatelessWidget {
  final String name;
  final String date;
  final String score;

  const PendingReviewItem({
    super.key,
    required this.name,
    required this.date,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4EA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF101400))),
              const SizedBox(height: 4),
              Text(date,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Score: $score",
                  style: const TextStyle(fontSize: 12, color: Color(0xFF101400))),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(70, 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Review", style: TextStyle(color: Color(0xFF101400)),),
              )
            ],
          )
        ],
      ),
    );
  }
}
