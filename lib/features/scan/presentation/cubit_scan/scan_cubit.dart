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
    emit(GeminiProcessingImageLoading());
    Future.delayed(Duration(seconds: 3));
    try {
      // Salin dan tempel kode ini untuk menggantikan jsonSchema yang lama

      final jsonSchema = Schema.object(
        properties: {
          'transactions': Schema.array(
            description:
                'Sebuah array yang berisi daftar semua objek transaksi yang ditemukan di struk. Kembalikan array kosong jika tidak ada transaksi yang ditemukan atau jika gambar bukan struk.',
            items: Schema.object(
              properties: {
                'id': Schema.string(
                  description:
                      'ID unik yang terdiri dari 12 karakter alfanumerik untuk setiap transaksi.',
                ),
                'name': Schema.string(
                  description: 'Nama barang atau jasa dari transaksi.',
                ),
                'amount': Schema.number(
                  description:
                      'Jumlah nominal transaksi dalam bentuk angka (tanpa simbol mata uang atau pemisah ribuan).',
                ),
                'date': Schema.string(
                  description:
                      'Tanggal transaksi. WAJIB dalam format YYYY-MM-DD agar dapat di-parse. Contoh: 2025-09-04.',
                ),
                'category': Schema.enumString(
                  description:
                      'Kategori transaksi sesuai dengan instruksi yang diberikan.',
                  enumValues: [
                    'Makanan & Minuman',
                    'Investasi',
                    'Laundry',
                    'Belanja',
                    'Uang Masuk',
                  ],
                ),
              },
            ),
          ),
        },
      );

      final model = FirebaseAI.googleAI().generativeModel(
        model: 'gemini-2.5-flash',
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: jsonSchema,
        ),
      );
      final prompt = TextPart("""
  Perhatikanlah gambar tersebut dengan saksama. 
  Jika gambar bukanlah struk transaksi, maka berikan respons kosong
  
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
  
  Tambahkan Properti ID yang benar-benar unik berjumlah 12 karakter untuk setiap transaksi.

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
