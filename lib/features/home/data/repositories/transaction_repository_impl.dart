import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

import '../../../scan/domain/entities/transaksi.dart';
import '../../domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Box<Transaksi> hiveBox;

  const TransactionRepositoryImpl({required this.hiveBox});

  @override
  Future<List<Transaksi>> getTransactionsFromHive() async{
    try {
      final transactions = hiveBox.values.toList().cast<Transaksi>()
        ..sort((a, b) => b.date.compareTo(a.date));
        return transactions;
    } catch (e) {
      throw Exception('Failed to retrieve transactions: $e');
    }
  }

  @override
  Future<Map<DateTime, List<Transaksi>>> getGroupedTransactionsFromHive() async {
    try {
      final transactions = hiveBox.values.toList().cast<Transaksi>()
        ..sort((a, b) => b.date.compareTo(a.date));

      final groupedData = groupBy<Transaksi, DateTime>(
        transactions,
        (transaction) => DateTime(
          transaction.date.year,
          transaction.date.month,
          transaction.date.day,
        ),
      );
      return groupedData;
    } catch (e) {
      throw Exception('Failed to retrieve grouped transactions: $e');
    }
  }
  
  @override
  Future<void> saveTransaction(Transaksi transaction) async {
    try {
      hiveBox.put(transaction.id, transaction);
    } catch (e) {
      throw Exception('Failed to save transaction: $e');
    }
  }
}
