import 'dart:io';
import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class SkinInjectorService {
  static const MethodChannel _channel = MethodChannel('com.tijeh.injector/saf');
  final Dio _dio = Dio();

  /// 1. Meminta izin pengguna untuk memilih folder Mobile Legends assets via SAF (Cukup 1 kali)
  Future<bool> requestMlbbFolderAccess() async {
    try {
      final bool result = await _channel.invokeMethod('requestFolderAccess');
      return result;
    } on PlatformException catch (e) {
      print("Gagal membuka folder picker: ${e.message}");
      return false;
    }
  }

  /// 2. Download zip dan langsung inject otomatis ke folder game
  Future<void> downloadAndInject({
    required Uri uri,
    required String heroName,
    required String skinName,
    required Function(double progress, String status) onProgress,
  }) async {
    try {
      onProgress(0.0, 'Mendownload arsip skin...');
      
      // Simpan sementara file ZIP di cache aplikasi
      final tempDir = Directory.systemTemp;
      final tempZipPath = '${tempDir.path}/skin_temp.zip';

      await _dio.download(
        uri.toString(),
        tempZipPath,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            // Progress download dari 0% - 50%
            double progress = (received / total) * 0.5;
            onProgress(progress, 'Mendownload: ${(progress * 100).toStringAsFixed(0)}%');
          }
        },
      );

      onProgress(0.5, 'Mengekstrak dan menginject ke game...');

      // Baca dan ekstrak file ZIP
      final zipFile = File(tempZipPath);
      final bytes = await zipFile.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      final totalFiles = archive.files.where((f) => f.isFile).length;
      int processedFiles = 0;

      for (final file in archive.files) {
        if (file.isFile) {
          final content = file.content as List<int>;
          
          // Kirim byte file ke Native Android untuk ditulis via SAF Document Tree
          try {
            await _channel.invokeMethod('writeSafFile', {
              'fileName': file.name,
              'fileBytes': content,
            });
          } catch (e) {
            print("Gagal menulis file ${file.name}: $e");
          }

          processedFiles++;
          // Progress injeksi dari 50% - 100%
          double progress = 0.5 + ((processedFiles / totalFiles) * 0.5);
          onProgress(progress, 'Menginject: $processedFiles / $totalFiles file');
        }
      }

      // Bersihkan file temporary
      if (await zipFile.exists()) {
        await zipFile.delete();
      }

      onProgress(1.0, 'Injeksi Berhasil!');
    } catch (e) {
      throw Exception('Gagal memproses injeksi: $e');
    }
  }
}