// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:save_up/features/scan/domain/entities/transaksi.dart';
import 'package:save_up/features/scan/domain/usecases/process_image_usecase.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final ProcessImageUsecase processImageUsecase;
  ScanCubit({required this.processImageUsecase}) : super(ScanInitial());

  void requestImage(ImageSource imageSource) async {
    emit(ScanImageLoading());
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      emit(ScanImageSuccess(imageFile));
    } else {
      emit(ScanEventFailure());
      emit(ScanInitial());
    }
  }

  Future<void> processImageInGemini(File imageFile) async {
    emit(GeminiProcessingImageLoading());
    try {
      final transactions = await processImageUsecase.call(imageFile);
      emit(GeminiProcessingImageSuccess(transactions));
      emit(ScanInitial());
    } catch (e) {
      print(e);
      emit(ScanEventFailure());
    }
  }
}
