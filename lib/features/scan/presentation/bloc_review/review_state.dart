part of 'review_bloc.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewFailure extends ReviewState {
  final String errorMessage;

  ReviewFailure(this.errorMessage);
}

final class ReviewInProgress extends ReviewState {}

final class ReviewSuccess extends ReviewState {

}
