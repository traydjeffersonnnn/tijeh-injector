import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SafInjectorService {
  static const platform = MethodChannel('com.tijeh.injector/saf');

  // 1. Meminta user memilih folder target (Arahkan user ke folder assets MLBB)
  static Future<String?> openDirectoryPicker() async {
    try {
      final String? uriString = await platform.invokeMethod('openDirectoryPicker');
      if (uriString != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('saved_saf_uri', uriString);
      }
      return uriString;
    } on PlatformException catch (e) {
      print("Gagal membuka picker: ${e.message}");
      return null;
    }
  }

  // 2. Mengirim file ke path di dalam folder SAF
  static Future<bool> injectSkinFile({
    required String relativePath, // Contoh: "dragon2017/assets/..."
    required Uint8List fileBytes,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final uriString = prefs.getString('saved_saf_uri');

      if (uriString == null) {
        print("URI SAF belum diatur! Harap pilih folder terlebih dahulu.");
        return false;
      }

      final bool success = await platform.invokeMethod('injectFile', {
        'uri': uriString,
        'path': relativePath,
        'bytes': fileBytes,
      });

      return success;
    } on PlatformException catch (e) {
      print("Gagal menginjeksi file: ${e.message}");
      return false;
    }
  }
}