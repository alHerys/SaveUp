import "../repositories/scan_repository.dart";
import '../entities/transaksi.dart';

class SaveTransactionsList {
  final ScanRepository repository;

  SaveTransactionsList({required this.repository});

  Future<void> call(List<Transaksi> transactions) async {
    await repository.saveTransactionsList(transactions);
  }
}