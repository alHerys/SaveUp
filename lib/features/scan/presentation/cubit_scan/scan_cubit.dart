import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  void requestImage(ImageSource imageSource) async {
    emit(ScanImageLoading());
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      emit(ScanImageSuccess(imageFile));
    } else {
      emit(ScanEventFailure('Image is Null'));
      emit(ScanInitial());
    }
  }

  void processImageInGemini() async {
    // Implement the logic to process the image using Gemini API
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    final model = GenerativeModel(
      model: 'gemini-2.0-flash-lite',
      apiKey: apiKey!,
    );
    final content = [
      Content.text('Can you give answer in JSON format? Show me!'),
    ];

    final (firstImage, secondImage) = await (
      File('image0.jpg').readAsBytes(),
      File('image1.jpg').readAsBytes(),
    ).wait;

    // final response = await model.generateContent(content);
    final prompt = TextPart("What's different between these pictures?");
    final imageParts = [
      DataPart('image/jpeg', firstImage),
      DataPart('image/jpeg', secondImage),
    ];
    final response = await model.generateContent([
      Content.multi([prompt, ...imageParts]),
    ]);
    // print(response.text);
  }
}
