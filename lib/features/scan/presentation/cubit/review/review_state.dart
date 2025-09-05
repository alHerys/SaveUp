part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewFailure extends ReviewState {}

final class ReviewRetrived extends ReviewState {
  final List<Transaksi> transactions;
  final int version;

  ReviewRetrived(this.transactions, {this.version = 0});
}

final class ReviewSaveSuccess extends ReviewState {}

class ReviewEditing extends ReviewState {
  final List<Transaksi> transactions; 
  final int editingIndex;             
  final Transaksi transactionToEdit;  

  ReviewEditing({
    required this.transactions,
    required this.editingIndex,
    required this.transactionToEdit,
  });
}
