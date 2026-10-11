import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class SkinPackageDownloader {
  SkinPackageDownloader({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<String> download({
    required Uri uri,
    required String heroName,
    required String skinName,
    required void Function(int received, int total) onProgress,
  }) async {
    final supportDirectory = await getApplicationSupportDirectory();
    final separator = Platform.pathSeparator;
    final heroDirectory = Directory(
      '${supportDirectory.path}${separator}skin_packages$separator'
      '${_fileSafeName(heroName)}',
    );
    await heroDirectory.create(recursive: true);

    final extension = uri.pathSegments.isEmpty
        ? ''
        : uri.pathSegments.last.split('.').last.toLowerCase();
    if (extension != 'zip' && extension != '7z') {
      throw ArgumentError.value(uri, 'uri', 'Only ZIP and 7z files are supported.');
    }
    final destination = File(
      '${heroDirectory.path}$separator${_fileSafeName(skinName)}.$extension',
    );
    await _dio.download(
      uri.toString(),
      destination.path,
      deleteOnError: true,
      options: Options(
        validateStatus: (status) => status != null && status >= 200 && status < 300,
      ),
      onReceiveProgress: onProgress,
    );
    return destination.path;
  }

  String _fileSafeName(String value) => value
      .trim()
      .replaceAll(RegExp(r'[^a-zA-Z0-9_-]+'), '_')
      .replaceAll(RegExp(r'_+'), '_')
      .toLowerCase();
}
