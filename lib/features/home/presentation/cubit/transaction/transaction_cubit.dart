import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:save_up/features/scan/entities/transaksi.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void loadTransactionFromHive() {
    try {
      emit(TransactionLoading());
      final box = Hive.box<Transaksi>('transaksiBox');
      final transactions = box.values.toList().cast<Transaksi>();
      emit(TransactionRetrived(transactions));
    } catch (e) {
      emit(TransactionError());
    }
  }
}
