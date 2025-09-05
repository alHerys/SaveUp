import 'dart:io';

import 'package:save_up/features/scan/domain/entities/transaksi.dart';
import 'package:save_up/features/scan/domain/repositories/scan_repository.dart';

class ProcessImageUsecase {
  final ScanRepository repository;

  ProcessImageUsecase(this.repository);

  Future<List<Transaksi>> call(File imageFile) async {
    return await repository.processImage(imageFile);
  }
}
