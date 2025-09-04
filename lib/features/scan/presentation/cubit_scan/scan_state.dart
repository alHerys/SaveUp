part of 'scan_cubit.dart';

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

final class GeminiProcessingImageLoading extends ScanState {}

final class GeminiProcessingImageSuccess extends ScanState {
  final List<Transaksi> daftarTransaksi;

  GeminiProcessingImageSuccess(this.daftarTransaksi);
}