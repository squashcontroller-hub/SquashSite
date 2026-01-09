import 'package:flutter/material.dart';
import 'StatTile.dart';
import 'friend.dart';

class FriendCard extends StatelessWidget {
  final Friend friend;

  const FriendCard({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xFFF7F3FA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: const Color(0xFF4CAF50),
                  child: Text(
                    friend.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        friend.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _buildStars(friend.rating),
                          const SizedBox(width: 8),
                          Text(
                            '🏆 ${friend.mmr} MMR',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                StatTile(label: 'Skills', value: friend.skills),
                const SizedBox(width: 12),
                StatTile(label: 'Fair Play', value: friend.fairPlay),
                const SizedBox(width: 12),
                StatTile(label: 'Tactics', value: friend.tactics),
                const SizedBox(width: 12),
                StatTile(label: 'Stamina', value: friend.stamina),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStars(double rating) {
    final fullStars = rating.floor();
    return Row(
      children: List.generate(
        5,
            (index) => Icon(
          index < fullStars ? Icons.star : Icons.star_border,
          size: 16,
          color: Colors.orange,
        ),
      ),
    );
  }
}
