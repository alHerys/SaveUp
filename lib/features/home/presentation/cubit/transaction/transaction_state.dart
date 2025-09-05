part of 'transaction_cubit.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionError extends TransactionState {}

final class TransactionRetrived extends TransactionState {
  final List<Transaksi> transactions;

  TransactionRetrived(this.transactions);
}

final class TransactionGrouped extends TransactionState {
  final Map<DateTime, List<Transaksi>> groupedTransactions;
  TransactionGrouped(this.groupedTransactions);
}
