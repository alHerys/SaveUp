import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_up/features/scan/domain/entities/transaksi.dart';

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

  Future<void> processImageInGemini(File imageFile) async {
    // Implement the logic to process the image using Gemini API
    // final apiKey = dotenv.env['GEMINI_API_KEY'];
    // final model = GenerativeModel(
    //   model: 'gemini-2.0-flash-lite',
    //   apiKey: apiKey!,
    // );
    // final content = [
    //   Content.text('Can you give answer in JSON format? Show me!'),
    // ];

    // final (firstImage, secondImage) = await (
    //   File('image0.jpg').readAsBytes(),
    //   File('image1.jpg').readAsBytes(),
    // ).wait;

    // // final response = await model.generateContent(content);
    // final prompt = TextPart("What's different between these pictures?");
    // final imageParts = [
    //   DataPart('image/jpeg', firstImage),
    //   DataPart('image/jpeg', secondImage),
    // ];
    // final response = await model.generateContent([
    //   Content.multi([prompt, ...imageParts]),
    // ]);
    // print(response.text);

    // Initialize the Gemini Developer API backend service
    // Create a `GenerativeModel` instance with a model that supports your use case
    emit(GeminiProcessingImageLoading());
    Future.delayed(Duration(seconds: 3));
    try {
      final model = FirebaseAI.googleAI().generativeModel(
        model: 'gemini-2.5-flash',
      );
      final prompt = TextPart("""
  Perhatikanlah gambar tersebut dengan saksama. 
  Jika gambar bukanlah struk transaksi, maka berikan respons kosong (null)
  
  Jika gambar adalah struk transaksi, maka analisalah daftar transaksi pada gambar tersebut untuk mendapatkan beberapa data berikut:
  1. Nama Barang Transaksi
  2. Nominal Transaksi
  3. Tanggal Transaksi
  4. Kategori Transaksi
  
  Apabila transaksi adalah pengeluaran, maka pilih salah satu berikut sebagai kategori: 
  a. Makanan & Minuman
  b. Investasi
  c. Laundry
  Jika transaksi tidak termasuk dalam ketiga kategori, maka atur default yaitu belanja
  
  Apabila transaksi adalah pemasukan, maka kategorinya adalah uang masuk.
  
  Biasanya akan terdapat banyak transaksi dalam gambar, oleh karena itu perhatikanlah dengan baik agar anda dapat memperoleh seluruh list transaksi yang terjadi pada gambar.
  
  Berikan output dalam format json
  """);

      final image = await imageFile.readAsBytes();
      final imagePart = InlineDataPart('image/jpeg', image);

      // To generate text output, call generateContent with the text input
      final response = await model.generateContent([
        Content.multi([prompt, imagePart]),
      ]);
      print(response.text);
      emit(ScanInitial());
    } catch (e) {
      emit(ScanEventFailure(e.toString()));
      print(e);
      // emit(ScanInitial());
    }
  }
}
