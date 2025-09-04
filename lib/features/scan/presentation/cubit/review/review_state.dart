part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewFailure extends ReviewState {}

// State baru ketika data siap untuk direview
final class ReviewLoaded extends ReviewState {
  final List<Transaksi> transactions;

  ReviewLoaded(this.transactions);
}

// State baru ketika data berhasil disimpan
final class ReviewSaveSuccess extends ReviewState {}