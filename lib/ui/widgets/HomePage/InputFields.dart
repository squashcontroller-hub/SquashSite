import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final String label;
  final String initialValue;

  const InputFields({
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.black45),),
          const SizedBox(height: 6),
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const TabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.green.shade500 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isActive? Colors.green.shade500 : Colors.transparent),
        ),
        child: Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
    );
  }
}

BoxDecoration cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
