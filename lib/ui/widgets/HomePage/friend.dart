class Friend {
  final String name;
  final int mmr;
  final double rating;
  final double skills;
  final double fairPlay;
  final double tactics;
  final double stamina;

  Friend({
    required this.name,
    required this.mmr,
    required this.rating,
    required this.skills,
    required this.fairPlay,
    required this.tactics,
    required this.stamina,
  });

  String get initials =>
      name.split(' ').map((e) => e[0]).take(2).join();
}
