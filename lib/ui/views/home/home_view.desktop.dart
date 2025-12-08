// main.dart
// Self-contained Flutter single-file demo approximating the provided sketch.
// Colors: Primary #0E5181, Secondary #1A1A1A, Accent #99CC33 (adjustable)

import 'package:flutter/material.dart';
import 'package:squashwebsite/ui/common/app_constants.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(HomeViewDesktop());
}

class HomeViewDesktop extends StatelessWidget {
  static const primary = Color(0xFF0E5181);
  static const secondary = Color(0xFF1A1A1A);
  static const accent = Color(0xFF99CC33);

  // Small layout tuning constant (max width for content on large displays)
  static const double maxContentWidth = 1200;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turniej UI - Sketch Inspired',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: createMaterialColor(primary))
            .copyWith(secondary: accent),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: secondary, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(color: secondary),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late final AnimationController _avatarController;

  @override
  void initState() {
    super.initState();
    _avatarController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _avatarController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeViewDesktop.primary, // frame color similar to sketch border
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: HomeViewDesktop.maxContentWidth),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LEFT: Slider (unchanged)
                  AppSidebar(),

                  const SizedBox(width: 18),

                  // MAIN LAYOUT: left small column + big central + right column
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left column: vertical box "5 ostatnich gier"
                        SizedBox(
                          width: 220,
                          child: Column(
                            children: [
                              RecentGamesTall(),
                              const SizedBox(height: 12),
                              _buildMiniCalendar(), // small extra under recent games
                            ],
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Center: large MatchCard (dominant), with terminal under it
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              SizedBox(height: 80), // miejsce by avatar wystawał

                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120.0), // karta niżej
                                    child: MatchCardLarge(),
                                  ),
                                  Positioned(
                                    top: 0, // avatar przy samej górze
                                    child: HeroAvatar(animation: _avatarController),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),


                            ],
                          ),
                        ),


                        const SizedBox(width: 16),

                        // Right column: Option B -> Chat on top + small extras below
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              ChatBox(),
                              const SizedBox(height: 12),
                              SidebarCard(
                                title: 'Status / Dodatki',
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [Text('Wygrałeś:'), Spacer(), Text('5')]),
                                    SizedBox(height: 8),
                                    Row(children: [Text('Przegrane:'), Spacer(), Text('2')]),
                                    SizedBox(height: 12),
                                    Text('Krótkie notatki:', style: TextStyle(fontWeight: FontWeight.w700)),
                                    SizedBox(height: 6),
                                    Text('- Rapid match', style: TextStyle(color: Colors.grey[700])),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              SidebarCard(
                                title: 'Historia gier',
                                child: Column(
                                  children: List.generate(
                                      3,
                                          (i) => ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                        leading: Icon(Icons.history),
                                        title: Text('Gra ${i + 1}'),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Left vertical slider (kept visually similar to original)
class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82,
      height: kdDesktopMaxContentHeight * 0.95, // leave it tall to mimic the sketch vertical slider
      decoration: BoxDecoration(
        color: HomeViewDesktop.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 18),
              _navIcon(Icons.home, 'Strona główna'),
              _navIcon(Icons.bar_chart, 'Statystyki'),
              _navIcon(Icons.history, 'Historia gier'),
              _navIcon(Icons.add_box, 'Dodaj mecz'),
              _navIcon(Icons.calendar_month, 'Terminarz'),
              _navIcon(Icons.chat, 'Czat'),
              _navIcon(Icons.person, 'Moje konto'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _navIcon(Icons.logout, 'Wyloguj'),
          )
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Tooltip(
        message: label,
        child: Container(
          decoration: BoxDecoration(
            color: HomeViewDesktop.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          width: 48,
          height: 48,
          child: Icon(icon, color: HomeViewDesktop.accent),
        ),
      ),
    );
  }
}

/// Large central MatchCard (dominant visual element). Contains animations as requested.
/// ---------------------------------------------------------------
/// NEW MATCH CARD — with floating avatar (clean, modern, aesthetic)
/// ---------------------------------------------------------------
class MatchCardLarge extends StatefulWidget {
  const MatchCardLarge({super.key});

  @override
  State<MatchCardLarge> createState() => _MatchCardLargeState();
}

class _MatchCardLargeState extends State<MatchCardLarge>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  final int wins = 3;
  final int losses = 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedIcon(IconData icon, Color color) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final scale = 1 + (_controller.value * 0.22);
        return Transform.scale(scale: scale, child: Icon(icon, size: 42, color: color));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        // -------------------------------
        //  CARD (moved downward)
        // -------------------------------
        Container(
          margin: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: HomeViewDesktop.accent.withOpacity(0.25),
                blurRadius: 12,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            elevation: 12,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 90, 22, 28),
              child: Row(
                children: [
                  // -------------------------------
                  // LEFT — player info
                  // -------------------------------
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NAZWA GRACZA',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                        SizedBox(height: 8),
                        Text('Tryb: 1v1 • Rundy: 3',
                            style: TextStyle(color: Colors.grey[700])),
                        SizedBox(height: 14),
                        InfoColumn(),
                        SizedBox(height: 14),

                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              Chip(
                                label: Text('Rating: 1200'),
                                backgroundColor: Colors.grey[200],
                              ),
                              SizedBox(width: 8),
                              Chip(
                                label: Text('Liga: Bronze'),
                                backgroundColor: Colors.grey[200],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // -------------------------------
                  // RIGHT — VS + stats
                  // -------------------------------
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(
                          'player 1  VS  player 2',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
                                (i) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(
                                Icons.star,
                                size: 26,
                                color: i < 3 ? HomeViewDesktop.accent : Colors.grey[300],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                _animatedIcon(Icons.close_rounded, Colors.red),
                                SizedBox(height: 6),
                                Text('$losses',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                Text('Przegrane',
                                    style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                              ],
                            ),
                            SizedBox(width: 28),
                            Column(
                              children: [
                                _animatedIcon(Icons.check_circle, Colors.green),
                                SizedBox(height: 6),
                                Text('$wins',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                Text('Wygrane',
                                    style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // -------------------------------
        // FLOATING AVATAR
        // ------------------------------
      ],
    );
  }
}

class HeroAvatar extends StatelessWidget {
  final Animation<double>? animation;

  const HeroAvatar({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220, // było 160 — potrzebujemy więcej miejsca na powiększenie
      child: AnimatedBuilder(
        animation: animation ?? AlwaysStoppedAnimation(0.5),
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // POWIĘKSZONE 3 PIERŚCIENIE
              ...List.generate(2, (i) {
                final scale = 1 + (animation?.value ?? 0.5) * (0.5 + i * 0.2);
                final opacity = (1 - (animation?.value ?? 0.5)).clamp(.3, .8);

                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 120,   // było 120
                    height: 120,  // było 120
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          HomeViewDesktop.accent.withOpacity(.05),
                          HomeViewDesktop.accent.withOpacity(.15),
                          Colors.white.withOpacity(.02),
                        ],
                        stops: [0.4, 0.7, 1.0],
                      ),
                      border: Border.all(
                        width: 2,
                        color: HomeViewDesktop.accent.withOpacity(.18),
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                  ),
                );
              }),

              // POWIĘKSZONY AVATAR
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      Color(0xffb8860b), // dark gold
                      Color(0xffffd700), // bright gold
                      Color(0xffffe57f), // light gold highlight
                      Color(0xffb8860b),
                    ],
                    stops: [0.0, 0.35, 0.65, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(.35),
                      blurRadius: 25,
                      spreadRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/alexa_bliss_pfp.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )


            ],
          );
        },
      ),
    );
  }
}






/// Info column inside match card (small meta)
class InfoColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Data: 01-01-21', style: TextStyle(color: Colors.grey[700])),
        SizedBox(height: 6),
        Text('Czas: 21:37', style: TextStyle(color: Colors.grey[700])),
        SizedBox(height: 6),
        Text('Typ: Turniej lokalny', style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}

/// Score column (VS and score)
class ScoreColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('player 1 VS player 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
      ],
    );
  }
}

/// Tall Recent Games box (left column)
class RecentGamesTall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('5 Ostatnich gier', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (_, __) => Divider(height: 12, color: Colors.grey[200]),
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: i % 2 == 0 ? Colors.green : Colors.red),
                        ),
                        SizedBox(width: 10),
                        Expanded(child: Text('Gra ${i + 1} • W-L-W-L', style: TextStyle(color: Colors.grey[800]))),
                        Text('21-01-20', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildMiniCalendar() {
  return Container(
    margin: EdgeInsets.only(top: 20),
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white24, width: 1),
    ),
    child: TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        todayDecoration: BoxDecoration(
          color: Colors.lightGreenAccent.withValues(alpha: .5),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.redAccent),
        weekdayStyle: TextStyle(color: Colors.white),
      ),
    ),
  );
}


/// Chat box (right column top)
class ChatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,       // ← trzyma szerokość
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Chat'),
              const SizedBox(height: 12),
              Text(
                'Your Chat Content',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/// Terminal panel below the MatchCard
class TerminalPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(Icons.terminal, color: Colors.grey[700]),
            SizedBox(width: 10),
            Expanded(child: Text('Panel terminala - filtry / szybkie komendy', style: TextStyle(color: Colors.grey[800]))),
            ElevatedButton(onPressed: () {}, child: Text('Filtruj')),
          ],
        ),
      ),
    );
  }
}

/// Reusable sidebar card used in right column
class SidebarCard extends StatelessWidget {
  final String title;
  final Widget child;
  const SidebarCard({required this.title, required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}

/// Helper to produce MaterialColor from Color (for ThemeData)
MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) strengths.add(0.1 * i);
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
