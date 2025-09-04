import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:save_up/features/scan/entities/transaksi.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  void loadReviewTransactions(List<Transaksi> transactions) {
    emit(ReviewLoaded(transactions));
  }

  void saveTransaction(List<Transaksi> transactions) async {
    try {
      emit(ReviewLoading());
      final Box box = Hive.box<Transaksi>('transaksiBox');
      for (var element in transactions) {
        await box.put(element.id, transactions);
      }
      emit(ReviewSaveSuccess());
    } catch (e) {
      emit(ReviewFailure());
    }
  } 
}
