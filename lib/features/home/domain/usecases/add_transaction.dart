import 'package:save_up/features/home/domain/repositories/transaction_repository.dart';
import 'package:save_up/features/scan/domain/entities/transaksi.dart';

class AddTransaction {
  final TransactionRepository repository;

  AddTransaction({required this.repository});

  Future<void> call(Transaksi transaksi) async {
    return await repository.saveTransaction(transaksi);
  }
}