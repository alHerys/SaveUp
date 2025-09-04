import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitial()) {
    on<RequestImage>((event, emit) async {
      emit(ScanImageLoading());
      final imageSource = event.imageSource;
      final picker = ImagePicker();

      final pickedFile = await picker.pickImage(
        source: switch (imageSource) {
          ImageSource.camera => ImageSource.camera,
          ImageSource.gallery => ImageSource.gallery,
        },
      );

      if (pickedFile != null) {
        final imageFile = File(pickedFile.path);
        emit(ScanImageSuccess(imageFile));
      } else {
        emit(ScanEventFailure('Image is Null'));
        emit(ScanInitial());
      }
    });

    on<ReviewCheckboxChanged>((event, emit) {
      final currentState = state;
      if (currentState is ReviewCheckboxState) {
        final updateValue = List<bool>.from(currentState.checkboxValues);
        updateValue[event.index] = event.newValue;
        emit(ReviewCheckboxState(checkboxValues: updateValue));
      }
    });
  }
}
