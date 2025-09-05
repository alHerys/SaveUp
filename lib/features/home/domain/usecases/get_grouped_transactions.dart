import 'package:save_up/features/scan/domain/entities/transaksi.dart';
import 'package:save_up/features/home/domain/repositories/transaction_repository.dart';

class GetGroupedTransactions {
  final TransactionRepository repository;

  GetGroupedTransactions(this.repository);

  Future<Map<DateTime, List<Transaksi>>> call() async {
    return await repository.getGroupedTransactionsFromHive();
  }
  
}