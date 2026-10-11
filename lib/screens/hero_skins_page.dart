import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:inject_skin/hero_catalog.dart';
import 'package:inject_skin/services/skin_package_downloader.dart';
import 'package:inject_skin/skin_script_urls.dart';
import 'package:inject_skin/theme/app_colors.dart';

class HeroSkinsPage extends StatefulWidget {
  const HeroSkinsPage({super.key, required this.role});

  final MlbbRole role;

  @override
  State<HeroSkinsPage> createState() => _HeroSkinsPageState();
}

class _HeroSkinsPageState extends State<HeroSkinsPage> {
  String _searchQuery = '';
  final _downloader = SkinPackageDownloader();

  String? _downloadingKey;
  double _downloadProgress = 0;

  List<HeroProfile> get _visibleHeroes => heroCatalog
      .where(
        (hero) =>
            hero.role == widget.role &&
            hero.name.toLowerCase().contains(_searchQuery.toLowerCase()),
      )
      .toList(growable: false);

  String _skinKey(HeroProfile hero, String skinName) =>
      '${hero.name}|$skinName';

  void _showMessage(String title, String message) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('Tutup'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadSkin(HeroProfile hero, String skinName) async {
    final key = _skinKey(hero, skinName);
    if (_downloadingKey != null) return;

    final url = scriptUrlForSkin(hero.name, skinName);
    if (url == null || url.trim().isEmpty) {
      _showMessage(
        '${hero.name} - $skinName',
        'URL script belum diatur di lib/skin_script_urls.dart.',
      );
      return;
    }

    final uri = Uri.tryParse(url.trim());
    final path = uri?.path.toLowerCase() ?? '';
    if (uri == null ||
        uri.scheme != 'https' ||
        (!path.endsWith('.zip') && !path.endsWith('.7z'))) {
      _showMessage(
        'URL Tidak Valid',
        'Gunakan URL HTTPS langsung ke file ZIP atau 7z.',
      );
      return;
    }

    setState(() {
      _downloadingKey = key;
      _downloadProgress = 0;
    });

    try {
      await _downloader.download(
        uri: uri,
        heroName: hero.name,
        skinName: skinName,
        onProgress: (received, total) {
          if (!mounted || total <= 0) return;
          setState(() {
            _downloadProgress = (received / total).clamp(0.0, 1.0);
          });
        },
      );

      if (!mounted) return;
      _showMessage(
        'Unduhan Berhasil',
        'Arsip $skinName berhasil diunduh ke penyimpanan aplikasi.',
      );
    } catch (error) {
      if (!mounted) return;
      _showMessage('Unduhan Gagal', 'Terjadi kesalahan saat mengunduh: $error');
    } finally {
      if (mounted) {
        setState(() {
          _downloadingKey = null;
          _downloadProgress = 0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final heroes = _visibleHeroes;
    return CupertinoPageScaffold(
      backgroundColor: appBlack,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: appPanel,
        border: const Border(bottom: BorderSide(color: appGoldBorder)),
        middle: Text(
          'HERO ${widget.role.label.toUpperCase()}',
          style: const TextStyle(
            color: appGoldLight,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
              child: CupertinoSearchTextField(
                placeholder: 'Cari hero ${widget.role.label}...',
                style: const TextStyle(color: Colors.white),
                placeholderStyle: const TextStyle(color: Color(0xFF998D76)),
                backgroundColor: appPanel,
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
            Expanded(
              child: heroes.isEmpty
                  ? const Center(
                      child: Text(
                        'Hero tidak ditemukan',
                        style: TextStyle(color: Color(0xFFAAA18E)),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 20),
                      itemCount: heroes.length,
                      itemBuilder: (context, index) {
                        final hero = heroes[index];
                        return _HeroSection(
                          hero: hero,
                          downloadingKey: _downloadingKey,
                          downloadProgress: _downloadProgress,
                          onSkinTap: (skin) => _downloadSkin(hero, skin),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.hero,
    required this.downloadingKey,
    required this.downloadProgress,
    required this.onSkinTap,
  });

  final HeroProfile hero;
  final String? downloadingKey;
  final double downloadProgress;
  final ValueChanged<String> onSkinTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 18,
                decoration: BoxDecoration(
                  color: appGold,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 9),
              Text(
                hero.name,
                style: const TextStyle(
                  color: appGoldLight,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                '${hero.skinNames.length} SKIN',
                style: const TextStyle(
                  color: Color(0xFF8E8062),
                  fontSize: 9,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 153,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: hero.skinNames.length,
              separatorBuilder: (_, _) => const SizedBox(width: 9),
              itemBuilder: (context, skinIndex) {
                final skin = hero.skinNames[skinIndex];
                return _SkinTile(
                  hero: hero,
                  skinName: skin,
                  index: skinIndex,
                  hasScript: scriptUrlForSkin(hero.name, skin) != null,
                  isDownloading: downloadingKey == '${hero.name}|$skin',
                  downloadProgress: downloadProgress,
                  onTap: () => onSkinTap(skin),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SkinTile extends StatelessWidget {
  const _SkinTile({
    required this.hero,
    required this.skinName,
    required this.index,
    required this.hasScript,
    required this.isDownloading,
    required this.downloadProgress,
    required this.onTap,
  });

  final HeroProfile hero;
  final String skinName;
  final int index;
  final bool hasScript;
  final bool isDownloading;
  final double downloadProgress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = index.isEven
        ? const [Color(0xFF342817), Color(0xFF17130D)]
        : const [Color(0xFF24211A), Color(0xFF11100D)];
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isDownloading ? null : onTap,
      child: Container(
        width: 116,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: appGoldBorder),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: appGoldBorder),
                        color: appBlack.withValues(alpha: 0.72),
                      ),
                    ),
                    Text(
                      hero.name.characters.first.toUpperCase(),
                      style: const TextStyle(
                        color: appGoldLight,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Positioned(
                      right: 14,
                      top: 17,
                      child: Icon(
                        CupertinoIcons.star_fill,
                        color: appGold,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(7, 6, 7, 7),
              decoration: const BoxDecoration(
                color: Color(0xE6080808),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(9)),
              ),
              child: Column(
                children: [
                  Text(
                    skinName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isDownloading) ...[
                        const CupertinoActivityIndicator(
                          radius: 5,
                          color: appGoldLight,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${(downloadProgress * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(
                            color: appGoldLight,
                            fontSize: 8,
                          ),
                        ),
                      ] else ...[
                        Icon(
                          hasScript
                              ? CupertinoIcons.arrow_down_circle_fill
                              : CupertinoIcons.link,
                          color: hasScript ? appGold : const Color(0xFF82765E),
                          size: 10,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          hasScript ? 'UNDUH ARSIP' : 'ATUR URL',
                          style: TextStyle(
                            color: hasScript
                                ? appGoldLight
                                : const Color(0xFF82765E),
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ],
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
