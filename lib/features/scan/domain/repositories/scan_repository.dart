import 'dart:io';

import 'package:save_up/features/scan/domain/entities/transaksi.dart';

abstract class ScanRepository {
  Future<List<Transaksi>> processImage(File imageFile);
  Future<void> saveTransactions(List<Transaksi> transactions);
}