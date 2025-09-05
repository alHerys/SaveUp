import 'dart:io';

import 'package:save_up/features/scan/domain/entities/transaksi.dart';

abstract interface class ScanRepository {
  Future<List<Transaksi>> geminiProcessImage(File imageFile);
  Future<void> saveTransactionsList(List<Transaksi> transactions);
}