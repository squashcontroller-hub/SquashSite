import 'package:flutter/material.dart';

import 'HomePage/InputFields.dart';

class SettingsView extends StatelessWidget {
  const SettingsView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 24),
          InputFields(label: 'Full Name', initialValue: 'John Anderson'),
          InputFields(label: 'Email Address', initialValue: 'john.anderson@email.com'),
          InputFields(label: 'Phone Number', initialValue: '+1 (555) 123-4567'),
          InputFields(label: 'Location', initialValue: 'New York, NY'),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            onPressed: () {},
            child: const Text('Save Changes', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
