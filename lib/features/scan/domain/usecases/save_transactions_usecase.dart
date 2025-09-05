import "../repositories/scan_repository.dart";
import '../entities/transaksi.dart';

class SaveTransactionsUsecase {
  final ScanRepository repository;

  SaveTransactionsUsecase(this.repository);

  Future<void> call(List<Transaksi> transactions) async {
    await repository.saveTransactions(transactions);
  }
}