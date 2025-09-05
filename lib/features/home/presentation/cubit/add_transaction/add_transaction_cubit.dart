import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:save_up/features/home/domain/usecases/add_transaction.dart';

import '../../../../scan/domain/entities/transaksi.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  final AddTransaction addTransactionUsecase;
  AddTransactionCubit({required this.addTransactionUsecase})
    : super(AddTransactionInitial());

  String _generateId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        12,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  

  void addTransaction({
    required String name,
    required double amount,
    required String category,
    required DateTime date,
  }) async {
    emit(AddTransactionLoading());
    try {
      final newTransaction = Transaksi(
        id: _generateId(),
        name: name,
        amount: amount,
        date: date,
        category: category,
      );
      await addTransactionUsecase(newTransaction);
      emit(AddTransactionSuccess());
    } catch (e) {
      emit(AddTransactionFailure());
    }
  }
}