const Map<String, String> skinScriptUrls = {
  'Yin|Attack On Titan':
      'https://raw.githubusercontent.com/traydjeffersonnnn/tijeh-injector/main/YIN%20AOT.7z',
  // Ganti USERNAME/REPO dengan repo GitHub Anda, lalu aktifkan baris skin
  // yang filenya sudah diunggah sebagai ZIP publik.
  // 'Chou|Epic - Dragon Boy':
  //     'https://raw.githubusercontent.com/USERNAME/REPO/main/skins/chou/epic-dragon-boy.zip',
  // 'Gusion|Legend - Cosmic Gleam':
  //     'https://raw.githubusercontent.com/USERNAME/REPO/main/skins/gusion/legend-cosmic-gleam.zip',
  // 'Fanny|Lightborn - Ranger':
  //     'https://raw.githubusercontent.com/USERNAME/REPO/main/skins/fanny/lightborn-ranger.zip',
  // 'Ling|Collector - Serene Plume':
  //     'https://raw.githubusercontent.com/USERNAME/REPO/main/skins/ling/collector-serene-plume.zip',
  //
  // Kunci harus sama persis dengan nama hero dan skin di hero_catalog.dart.
};

String? scriptUrlForSkin(String heroName, String skinName) =>
    skinScriptUrls['$heroName|$skinName'];
