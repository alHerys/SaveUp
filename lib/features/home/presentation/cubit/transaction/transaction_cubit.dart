import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
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

  void groupLoadTransactionFromHive() {
    try {
      emit(TransactionLoading());
      final box = Hive.box<Transaksi>('transaksiBox');

      // Ambil dan urutkan transaksi dari yang terbaru
      final transactions = box.values.toList().cast<Transaksi>()
        ..sort((a, b) => b.date.compareTo(a.date));

      // Kelompokkan transaksi berdasarkan tanggal (tanpa jam, menit, detik)
      final groupedData = groupBy<Transaksi, DateTime>(
        transactions,
        (transaksi) => DateTime(
          transaksi.date.year,
          transaksi.date.month,
          transaksi.date.day,
        ),
      );

      emit(TransactionGrouped(groupedData));
    } catch (e) {
      emit(TransactionError());
    }
  }
}
