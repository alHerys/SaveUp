import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:save_up/features/scan/models/transaksi.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  void loadReviewTransactions(List<Transaksi> transactions) {
    emit(ReviewRetrived(transactions));
  }

  Future<void> saveTransaction(List<Transaksi> transactions) async {
    try {
      emit(ReviewLoading());
      final Box box = Hive.box<Transaksi>('transaksiBox');
      for (var element in transactions) {
        await box.put(element.id, element);
      }
      emit(ReviewSaveSuccess());
    } catch (e) {
      emit(ReviewFailure());
      print(e);
    }
  }

  void startEditing(int index) {
    final currentState = state as ReviewRetrived;
    emit(
      ReviewEditing(
        transactions: currentState.transactions,
        editingIndex: index,

        transactionToEdit: currentState.transactions[index].copyWith(),
      ),
    );
  }

  void updateEditingField({String? name, String? amount, String? category}) {
    final currentState = state as ReviewEditing;
    emit(
      ReviewEditing(
        transactions: currentState.transactions,
        editingIndex: currentState.editingIndex,
        transactionToEdit: currentState.transactionToEdit.copyWith(
          name: name,
          amount: double.tryParse(amount ?? ''),
          category: category,
        ),
      ),
    );
  }

  void saveEdit() {
    final currentState = state as ReviewEditing;
    final updatedList = List<Transaksi>.from(currentState.transactions);
    updatedList[currentState.editingIndex] = currentState.transactionToEdit;

    // Kembali ke state ReviewLoaded dengan data yang sudah diperbarui
    emit(
      ReviewRetrived(
        updatedList,
        version: DateTime.now().millisecondsSinceEpoch, // Trik untuk update UI
      ),
    );
  }

  void cancelEdit() {
    final currentState = state as ReviewEditing;
    // Kembali ke state ReviewLoaded tanpa menyimpan perubahan
    emit(ReviewRetrived(currentState.transactions));
  }
}
