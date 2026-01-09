import 'package:flutter/material.dart';
import '../../widgets/HomePage/FriendCard.dart';
import '../../widgets/HomePage/PlayerSearchBar.dart';
import '../../widgets/HomePage/friend.dart';

class FriendsPage extends StatelessWidget {
  FriendsPage({super.key});

  final friends = [
    Friend(
      name: 'Alex Johnson',
      mmr: 1580,
      rating: 4,
      skills: 8.0,
      fairPlay: 8.5,
      tactics: 8.2,
      stamina: 7.5,
    ),
    Friend(
      name: 'Maria Garcia',
      mmr: 1820,
      rating: 5,
      skills: 9.0,
      fairPlay: 9.5,
      tactics: 8.8,
      stamina: 8.5,
    ),
    Friend(
      name: 'James Smith',
      mmr: 1450,
      rating: 3,
      skills: 7.5,
      fairPlay: 8.0,
      tactics: 7.0,
      stamina: 7.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PlayerSearchBar(),
              const SizedBox(height: 24),
              Text(
                'Your Friends (${friends.length})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF16A34A),
                ),
              ),
              const SizedBox(height: 12),
              ...friends.map((f) => FriendCard(friend: f)),
            ],
          ),
        ),
      ),
    );
  }
}
