import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TijehInjectorApp());
}

class TijehInjectorApp extends StatelessWidget {
  const TijehInjectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIJEH INJECTOR MLBB',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.amber,
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
          surface: Color(0xFF121212),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 1. SPLASH SCREEN (Black & Gold Premium)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF2e2600), Colors.black],
            radius: 0.85,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.amber, width: 2.5),
                color: Colors.black,
                boxShadow: const [
                  BoxShadow(color: Colors.amberAccent, blurRadius: 25, spreadRadius: 2),
                ],
              ),
              child: const Icon(Icons.flash_on_rounded, size: 75, color: Colors.amber),
            ),
            const SizedBox(height: 28),
            const Text(
              'TIJEH INJECTOR MLBB',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.amber,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'App Skin The Best • Safe & Fast Injection',
              style: TextStyle(fontSize: 12, color: Colors.amberAccent, letterSpacing: 0.8),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. DASHBOARD / HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF1a1700),
              ),
              child: const Icon(Icons.bolt, color: Colors.amber, size: 20),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TIJEH INJECTOR MLBB',
                  style: TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  'App Skin The Best 2026',
                  style: TextStyle(color: Colors.white60, fontSize: 9),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active, color: Colors.amber),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14.0),
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFF382e00), Color(0xFF0f0e00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.amber, width: 1.5),
              boxShadow: [
                BoxShadow(color: Colors.amber.withOpacity(0.15), blurRadius: 10),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Icon(Icons.sports_esports, size: 110, color: Colors.amber.withOpacity(0.12)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'TIJEH INJECTOR MLBB',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('UNLOCK ALL SKIN & SCRIPT 2026', style: TextStyle(fontSize: 11, color: Colors.white70)),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(6)),
                            child: const Text('100% WORKING', style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: Colors.green.shade800, borderRadius: BorderRadius.circular(6)),
                            child: const Text('SAFE NO BAN', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1f1a00),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.withOpacity(0.4)),
            ),
            child: const Row(
              children: [
                Icon(Icons.volume_up_rounded, color: Colors.amber, size: 18),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'UPDATE REGULER || 📢 TIJEH INJECTOR OFFICIAL TEAM',
                    style: TextStyle(color: Colors.amberAccent, fontSize: 11, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _buildMenuTile(
            context,
            title: 'UNLOCK SKIN',
            subtitle: '#Unlock All Skin Mlbb',
            icon: Icons.lock_open_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
              );
            },
          ),
          _buildMenuTile(
            context,
            title: 'RANK BOOSTER',
            subtitle: '#Boost Rank & Damage',
            icon: Icons.trending_up_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RankBoosterScreen()),
              );
            },
          ),
          _buildMenuTile(
            context,
            title: 'ALL EFFECT',
            subtitle: '#All Effect Mlbb',
            icon: Icons.flash_on_rounded,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu All Effect')));
            },
          ),
          _buildMenuTile(
            context,
            title: 'MORE MENU',
            subtitle: '#More Menu Effect',
            icon: Icons.grid_view_rounded,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu More')));
            },
          ),
          _buildMenuTile(
            context,
            title: 'TUTORIAL',
            subtitle: '#How to use injector',
            icon: Icons.help_outline_rounded,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu Tutorial')));
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.help_rounded, color: Colors.amber),
              onPressed: () {},
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.amber.withOpacity(0.3), blurRadius: 8),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: const Row(
                children: [
                  Icon(Icons.home_rounded, color: Colors.black, size: 20),
                  SizedBox(width: 6),
                  Text('HOME', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.settings_rounded, color: Colors.amber),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, {required String title, required String subtitle, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF141200),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.amber, width: 1.2),
          boxShadow: [
            BoxShadow(color: Colors.amber.withOpacity(0.05), blurRadius: 6),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.amber, width: 1.2),
                color: Colors.black,
              ),
              child: Icon(icon, color: Colors.amber, size: 22),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: Colors.white60, fontSize: 11)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.amber, size: 16),
          ],
        ),
      ),
    );
  }
}

// 3. RANK BOOSTER SCREEN
class RankBoosterScreen extends StatefulWidget {
  const RankBoosterScreen({super.key});

  @override
  State<RankBoosterScreen> createState() => _RankBoosterScreenState();
}

class _RankBoosterScreenState extends State<RankBoosterScreen> {
  bool getDamageUp = false;
  bool getTeamPro = false;
  bool getEnemyLag = false;
  bool getEnemyBot = false;
  bool attackSpeed = false;
  bool fastFarming = false;
  bool autoHook = false;

  String selectedMode = 'Ranked';
  String selectedRank = 'Mythic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.amber),
        title: const Text('RANK BOOSTER', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14.0),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1c1800),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.amber, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.amber.withOpacity(0.4), blurRadius: 6),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'T',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'TIJEH LITE™',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const Icon(Icons.power_settings_new_rounded, color: Colors.amber, size: 26),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF121000),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.withOpacity(0.6), width: 1),
            ),
            child: const Text(
              'ACTIVE STATUS : PERMANENT VIP 2026',
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 11,
                letterSpacing: 0.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF141200),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber, width: 1.5),
            ),
            child: Column(
              children: [
                _buildSwitchTile('GET DAMAGE UP', getDamageUp, (v) => setState(() => getDamageUp = v)),
                _buildSwitchTile('GET TEAM PRO', getTeamPro, (v) => setState(() => getTeamPro = v)),
                _buildSwitchTile('GET ENEMY LAG', getEnemyLag, (v) => setState(() => getEnemyLag = v)),
                _buildSwitchTile('GET ENEMY BOT', getEnemyBot, (v) => setState(() => getEnemyBot = v)),
                _buildSwitchTile('ATTACK SPEED', attackSpeed, (v) => setState(() => attackSpeed = v)),
                _buildSwitchTile('FAST FARMING', fastFarming, (v) => setState(() => fastFarming = v)),
                _buildSwitchTile('AUTO HOOK', autoHook, (v) => setState(() => autoHook = v)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF241f00),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<String>(
                        value: selectedMode,
                        dropdownColor: Colors.black,
                        style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13),
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.amber),
                        items: ['Ranked', 'Classic', 'Brawl'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => selectedMode = val);
                        },
                      ),
                      Container(height: 20, width: 1, color: Colors.amber.withOpacity(0.5)),
                      DropdownButton<String>(
                        value: selectedRank,
                        dropdownColor: Colors.black,
                        style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 13),
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.amber),
                        items: ['Warrior', 'Epic', 'Legend', 'Mythic'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => selectedRank = val);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Rank Booster Applied! Opening Mobile Legends...')),
                    );
                  },
                  child: const Text('OPEN MLBB', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2b2400),
                    foregroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: Colors.amber, width: 1.2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opening Tutorial...')),
                    );
                  },
                  child: const Text('TUTORIAL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF241f00),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
          Switch(
            value: value,
            activeColor: Colors.black,
            activeTrackColor: Colors.amber,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.black54,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

// 4. ROLE SELECTION SCREEN
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roles = [
      {'name': 'Assassin', 'icon': Icons.flash_on_rounded},
      {'name': 'Fighter', 'icon': Icons.security_rounded},
      {'name': 'Marksman', 'icon': Icons.gps_fixed_rounded},
      {'name': 'Tank', 'icon': Icons.shield_rounded},
      {'name': 'Mage', 'icon': Icons.auto_awesome_rounded},
      {'name': 'Support', 'icon': Icons.local_hospital_rounded},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Select Role Hero', style: TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemCount: roles.length,
          itemBuilder: (context, index) {
            final role = roles[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroListScreen(role: role['name'] as String)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF161400),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amber, width: 1.2),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(role['icon'] as IconData, color: Colors.amber, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      role['name'] as String,
                      style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// 5. LIST HERO & SKIN
class HeroListScreen extends StatefulWidget {
  final String role;
  const HeroListScreen({super.key, required this.role});

  @override
  State<HeroListScreen> createState() => _HeroListScreenState();
}

class _HeroListScreenState extends State<HeroListScreen> {
  static const platform = MethodChannel('com.tijeh.injector/shizuku');

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> heroData = {
      'Mage': [
        {
          'hero': 'Cyclops',
          'skins': [
            {'skin': 'Exorcist', 'type': 'COLLECTOR', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
            {'skin': 'Super Adventure', 'type': 'ELITE', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
            {'skin': 'Deep Sea Rescuer', 'type': 'STAR', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
          ]
        },
        {
          'hero': 'Harith',
          'skins': [
            {'skin': 'Harith x Killua', 'type': 'ANIME', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
            {'skin': 'Stardust', 'type': 'ELITE', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
            {'skin': 'Lightborn', 'type': 'EPIC', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
          ]
        },
      ],
      'Fighter': [
        {
          'hero': 'Yin',
          'skins': [
            {'skin': 'Yin x Eren', 'type': 'ANIME', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
          ]
        },
      ],
      'Assassin': [
        {
          'hero': 'Gusion',
          'skins': [
            {'skin': 'Cosmic Gleam', 'type': 'LEGEND', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
          ]
        },
      ],
      'Marksman': [
        {
          'hero': 'Obsidia',
          'skins': [
            {'skin': 'Aspirants Skin', 'type': 'Aspirant', 'githubArchive': 'ObisiaAspirantsv2.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
          ]
        },
      ],
    };

    final listHero = heroData[widget.role] ?? [
      {
        'hero': 'Custom Hero',
        'skins': [
          {'skin': 'Default Skin', 'type': 'SPECIAL', 'githubArchive': 'HarithKillua.zip', 'imageUrl': 'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/HarithKillua.jpg'},
        ]
      }
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.role, style: const TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: listHero.length,
        itemBuilder: (context, index) {
          final heroItem = listHero[index];
          final heroName = heroItem['hero'] as String;
          final skins = heroItem['skins'] as List<Map<String, String>>;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      '--- $heroName ---',
                      style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(child: Divider(color: Colors.amber, thickness: 0.8)),
                  ],
                ),
              ),
              SizedBox(
                height: 220, // Dipertinggi agar kartu lebih besar dan proporsional
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: skins.length,
                  itemBuilder: (context, skinIndex) {
                    final skin = skins[skinIndex];
                    return SkinCard(
                      heroName: heroName,
                      skinName: skin['skin']!,
                      skinType: skin['type']!,
                      githubArchive: skin['githubArchive']!,
                      imageUrl: skin['imageUrl']!,
                      platform: platform,
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }
}

// 6. SKIN CARD WIDGET (Diperbesar/Ditinggikan Ukurannya & Menampilkan Gambar GitHub)
class SkinCard extends StatelessWidget {
  final String heroName;
  final String skinName;
  final String skinType;
  final String githubArchive;
  final String imageUrl;
  final MethodChannel platform;

  const SkinCard({
    super.key,
    required this.heroName,
    required this.skinName,
    required this.skinType,
    required this.githubArchive,
    required this.imageUrl,
    required this.platform,
  });

  void _showIOSLoadingDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoTheme(
          data: const CupertinoThemeData(brightness: Brightness.dark),
          child: CupertinoAlertDialog(
            title: const Text('Injecting Skin', style: TextStyle(fontWeight: FontWeight.bold)),
            content: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CupertinoActivityIndicator(radius: 16.0),
                  const SizedBox(height: 16),
                  Text(
                    'Downloading & Injecting $skinName ($heroName)...\nPlease wait.',
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showIOSResultDialog(BuildContext context, {required bool isSuccess, String? errorMessage}) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoTheme(
          data: const CupertinoThemeData(brightness: Brightness.dark),
          child: CupertinoAlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isSuccess ? CupertinoIcons.check_mark_circled : CupertinoIcons.clear_circled,
                  color: isSuccess ? Colors.greenAccent : Colors.redAccent,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  isSuccess ? 'Success' : 'Failed',
                  style: TextStyle(
                    color: isSuccess ? Colors.greenAccent : Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                isSuccess
                    ? 'Skin $skinName successfully injected into Mobile Legends!'
                    : 'Failed to inject $skinName.\n${errorMessage ?? "Check GitHub link or Shizuku permission."}',
                style: const TextStyle(fontSize: 13),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK', style: TextStyle(color: Colors.amber)),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _injectFromGithub(BuildContext context) async {
    final String githubRawUrl = "https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/$githubArchive";

    _showIOSLoadingDialog(context);

    try {
      final bool? success = await platform.invokeMethod('injectFromGithub', {
        'url': githubRawUrl,
        'fileName': githubArchive,
      });

      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      if (context.mounted) {
        _showIOSResultDialog(context, isSuccess: success == true);
      }
    } on PlatformException catch (e) {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        _showIOSResultDialog(context, isSuccess: false, errorMessage: e.message);
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        _showIOSResultDialog(context, isSuccess: false, errorMessage: e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Lebar kartu diperbesar
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF141200),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Bagian Gambar Skin dari GitHub
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.amber),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.broken_image, color: Colors.amber, size: 30),
                  );
                },
              ),
            ),
          ),
          // Bagian Teks Info Skin
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Column(
              children: [
                Text(
                  skinName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                Text(
                  skinType,
                  style: const TextStyle(fontSize: 9, color: Colors.amber, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Tombol Inject
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: double.infinity,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () => _injectFromGithub(context),
                child: const Text('Inject', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}