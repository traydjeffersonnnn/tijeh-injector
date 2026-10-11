import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inject_skin/hero_catalog.dart';
import 'package:inject_skin/screens/hero_skins_page.dart';
import 'package:inject_skin/theme/app_colors.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: appBlack,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: appPanel,
        border: Border(bottom: BorderSide(color: appGoldBorder)),
        middle: Text(
          'PILIH ROLE',
          style: TextStyle(
            color: appGoldLight,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih role hero',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Cari koleksi hero dan skin berdasarkan role.',
                style: TextStyle(color: Color(0xFFAAA18E), fontSize: 13),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: MlbbRole.values.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.05,
                  ),
                  itemBuilder: (context, index) {
                    final role = MlbbRole.values[index];
                    final count = heroCatalog
                        .where((hero) => hero.role == role)
                        .length;
                    return _RoleTile(
                      role: role,
                      heroCount: count,
                      onTap: () => Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (_) => HeroSkinsPage(role: role),
                        ),
                      ),
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

class _RoleTile extends StatelessWidget {
  const _RoleTile({
    required this.role,
    required this.heroCount,
    required this.onTap,
  });

  final MlbbRole role;
  final int heroCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: appPanel,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appGoldBorder, width: 1.2),
        ),
        child: Row(
          children: [
            Icon(role.icon, color: appGoldLight, size: 21),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: appGoldLight,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '$heroCount hero',
                    style: const TextStyle(
                      color: Color(0xFFAAA18E),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              color: appGold,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
