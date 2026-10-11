import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inject_skin/screens/role_selection_page.dart';
import 'package:inject_skin/theme/app_colors.dart';

class TijehHomePage extends StatelessWidget {
  const TijehHomePage({super.key});

  void _showComingSoon(BuildContext context, String feature) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(feature),
        content: const Text('Fitur ini akan tersedia pada pembaruan berikutnya.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Tutup'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: appBlack,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(
                color: appPanel,
                border: Border(bottom: BorderSide(color: appGoldBorder)),
              ),
              child: Row(
                children: [
                  const GoldTLogo(size: 34),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'TIJEH INJECTOR',
                      style: TextStyle(
                        color: appGoldLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => _showComingSoon(context, 'Notifikasi'),
                    child: const Icon(
                      CupertinoIcons.bell,
                      color: appGold,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(14, 18, 14, 20),
                children: [
                  Container(
                    height: 176,
                    decoration: BoxDecoration(
                      color: appBlack,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: appGoldBorder, width: 1.2),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF211A0D), appBlack, Color(0xFF17120A)],
                      ),
                    ),
                    child: const Center(child: GoldTLogo(size: 112)),
                  ),
                  const SizedBox(height: 20),
                  _HomeFeatureTile(
                    title: 'UNLOCK ALL SKIN',
                    subtitle: 'Pilih role dan cari skin hero',
                    icon: CupertinoIcons.lock_open_fill,
                    onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (_) => const RoleSelectionPage(),
                      ),
                    ),
                  ),
                  _HomeFeatureTile(
                    title: 'DRONE VIEW',
                    subtitle: 'Fitur kamera dalam game',
                    icon: CupertinoIcons.viewfinder,
                    onTap: () => _showComingSoon(context, 'Drone View'),
                  ),
                  _HomeFeatureTile(
                    title: 'ALL EFFECT',
                    subtitle: 'Efek visual Mobile Legends',
                    icon: CupertinoIcons.sparkles,
                    onTap: () => _showComingSoon(context, 'All Effect'),
                  ),
                  _HomeFeatureTile(
                    title: 'MORE MENU',
                    subtitle: 'Pengaturan dan informasi',
                    icon: CupertinoIcons.ellipsis_circle_fill,
                    onTap: () => _showComingSoon(context, 'More Menu'),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'PILIH SKIN FAVORITMU',
                      style: TextStyle(
                        color: Color(0xFF8E8062),
                        fontSize: 10,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 62,
              decoration: const BoxDecoration(
                color: appPanel,
                border: Border(top: BorderSide(color: appGoldBorder)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const _BottomAction(
                    icon: CupertinoIcons.house_fill,
                    label: 'HOME',
                    selected: true,
                  ),
                  _BottomAction(
                    icon: CupertinoIcons.question_circle_fill,
                    label: 'BANTUAN',
                    onTap: () => _showComingSoon(context, 'Bantuan'),
                  ),
                  _BottomAction(
                    icon: CupertinoIcons.settings_solid,
                    label: 'PENGATURAN',
                    onTap: () => _showComingSoon(context, 'Pengaturan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoldTLogo extends StatelessWidget {
  const GoldTLogo({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.025),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [appGoldLight, appGold, Color(0xFF765418)],
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: appBlack,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [appGoldLight, appGold],
          ).createShader(bounds),
          child: Text(
            'T',
            style: TextStyle(
              color: Colors.white,
              fontSize: size * 0.66,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeFeatureTile extends StatelessWidget {
  const _HomeFeatureTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: appPanel,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: appGoldBorder),
          ),
          child: Row(
            children: [
              const GoldTLogo(size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: appGoldLight,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        letterSpacing: 0.7,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFFAAA18E),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(icon, color: appGold, size: 23),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.icon,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? appGoldLight : const Color(0xFF9A8A68);
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 19, color: color),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 8,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
