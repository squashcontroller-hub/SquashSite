import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const RatingBar({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: TextStyle(color: Colors.black45),)),
              Text('${value.toStringAsFixed(1)} / 10', style: TextStyle(color: Colors.black45),),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: value / 10,
            color: color,
            backgroundColor: Colors.grey.shade200,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
    );
  }
}
