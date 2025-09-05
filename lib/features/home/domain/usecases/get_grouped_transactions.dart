import 'package:save_up/features/scan/domain/entities/transaksi.dart';
import 'package:save_up/features/home/domain/repositories/transaction_repository.dart';

class FetchGroupedTransactions {
  final TransactionRepository repository;

  FetchGroupedTransactions(this.repository);

  Future<Map<DateTime, List<Transaksi>>> call() async {
    return await repository.getGroupedTransactionsFromHive();
  }
  
}