import 'package:save_up/features/scan/domain/entities/transaksi.dart';
import 'package:save_up/features/home/domain/repositories/transaction_repository.dart';

class FetchTransactions {
  final TransactionRepository repository;

  FetchTransactions(this.repository);

  Future<List<Transaksi>> call() async {
    return await repository.getTransactionsFromHive();
  }
}