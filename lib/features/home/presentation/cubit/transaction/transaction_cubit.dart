import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:save_up/features/home/domain/usecases/get_grouped_transactions.dart';
import 'package:save_up/features/home/domain/usecases/get_transactions.dart';
import 'package:save_up/features/scan/domain/entities/transaksi.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final FetchTransactions getTransactions;
  final FetchGroupedTransactions getGroupedTransactions;

  TransactionCubit({required this.getTransactions, required this.getGroupedTransactions})
    : super(TransactionInitial());

  Future<void> loadTransactionFromHive() async {
    try {
      emit(TransactionLoading());

      final transactions = await getTransactions();

      emit(TransactionRetrived(transactions));
    } catch (e) {
      emit(TransactionError());
    }
  }

  Future<void> groupLoadTransactionFromHive() async {
    try {
      emit(TransactionLoading());
      final groupedData = await getGroupedTransactions();

      emit(TransactionGrouped(groupedData));
    } catch (e) {
      emit(TransactionError());
    }
  }
}
