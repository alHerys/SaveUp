import 'package:save_up/features/scan/domain/entities/transaksi.dart';

abstract class TransactionRepository {
  Future<List<Transaksi>> getTransactionsFromHive(); 
  Future<Map<DateTime, List<Transaksi>>> getGroupedTransactionsFromHive();
}