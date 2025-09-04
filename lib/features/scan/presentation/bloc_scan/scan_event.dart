part of 'scan_bloc.dart';

@immutable
sealed class ScanEvent {}

final class RequestImage extends ScanEvent {
  final ImageSource imageSource;

  RequestImage(this.imageSource);
}

final class RequestGemini extends ScanEvent {
  final File image;

  RequestGemini({required this.image});
}

final class ReviewCheckboxChanged extends ScanEvent {
  final bool newValue;
  final int index;

  ReviewCheckboxChanged(this.newValue, this.index);
}
