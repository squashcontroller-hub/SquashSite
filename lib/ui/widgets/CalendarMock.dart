import 'package:flutter/material.dart';

class CalendarMock extends StatelessWidget {
  const CalendarMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // MONTH HEADER
        Row(
          children: const [
            Text(
              'January 2026',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Icon(Icons.chevron_left),
            SizedBox(width: 8),
            Text('Today'),
            SizedBox(width: 8),
            Icon(Icons.chevron_right),
          ],
        ),
        const SizedBox(height: 16),

        // DAYS HEADER
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 7,
          childAspectRatio: 2.5,
          children: const [
            'Sun','Mon','Tue','Wed','Thu','Fri','Sat'
          ].map((d) => Center(
            child: Text(
              d,
              style: TextStyle(color: Color(0xFF64748B)),
            ),
          )).toList(),
        ),

        const SizedBox(height: 8),

        // DAYS GRID
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 35,
          itemBuilder: (context, index) {
            final day = index + 1;
            final isSelected = day == 9;

            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFECFDF5)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF22C55E)
                      : const Color(0xFFE2E8F0),
                ),
              ),
              child: Text(
                '$day',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF16A34A)
                      : Colors.black,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
