import 'dart:io';

import 'package:save_up/features/scan/domain/entities/transaksi.dart';
import 'package:save_up/features/scan/domain/repositories/scan_repository.dart';

class GeminiProcessImage {
  final ScanRepository repository;

  GeminiProcessImage(this.repository);

  Future<List<Transaksi>> call(File imageFile) async {
    return await repository.geminiProcessImage(imageFile);
  }
}
