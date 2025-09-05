part of 'review_cubit.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewFailure extends ReviewState {}

final class ReviewGetter extends ReviewState {
  final List<Transaksi> transactions;

  ReviewGetter(this.transactions);
}

final class ReviewSaveSuccess extends ReviewState {}