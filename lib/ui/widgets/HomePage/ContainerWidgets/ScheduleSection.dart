import 'package:flutter/material.dart';

import 'SectionCard.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "Schedule",
      trailing: const Icon(Icons.calendar_today, size: 18),
      child: Column(
        children: const [
          ScheduleItem(
            name: "Alex Johnson",
            date: "Dec 18 at 18:00",
            court: "Court 1",
          ),
          SizedBox(height: 12),
          ScheduleItem(
            name: "James Smith",
            date: "Dec 20 at 19:30",
            court: "Court 3",
          ),
          SizedBox(height: 12),
          ScheduleItem(
            name: "Maria Garcia",
            date: "Dec 22 at 17:00",
            court: "Court 2",
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String name;
  final String date;
  final String court;

  const ScheduleItem({
    super.key,
    required this.name,
    required this.date,
    required this.court,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
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
          Text(
            court,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
