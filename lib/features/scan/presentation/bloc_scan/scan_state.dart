part of 'scan_bloc.dart';

@immutable
sealed class ScanState {}

final class ScanInitial extends ScanState {}

final class ScanEventFailure extends ScanState {
  final String message;

  ScanEventFailure(this.message);
}

final class ScanImageLoading extends ScanState {}

final class ScanImageSuccess extends ScanState {
  final File image;

  ScanImageSuccess(this.image);
}

final class ReviewCheckboxState extends ScanState {
  final List<bool> checkboxValues;

  ReviewCheckboxState({required this.checkboxValues});

  ReviewCheckboxState copyWith({List<bool>? checkboxValues}) {
    return ReviewCheckboxState(
      checkboxValues: checkboxValues ?? this.checkboxValues,
    );
  }
}