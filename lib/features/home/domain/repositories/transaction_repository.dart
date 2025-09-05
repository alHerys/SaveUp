import 'package:save_up/features/scan/domain/entities/transaksi.dart';

abstract interface class TransactionRepository {
  Future<List<Transaksi>> getTransactionsFromHive(); 
  Future<Map<DateTime, List<Transaksi>>> getGroupedTransactionsFromHive();
  Future<void> saveTransaction(Transaksi transaction);
}