import 'dart:convert';
import 'dart:io';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:hive/hive.dart';
import 'package:save_up/features/scan/domain/entities/transaksi.dart';

import '../../domain/repositories/scan_repository.dart';

class ScanRepositoryImpl implements ScanRepository {
  final Box<Transaksi> transactionsBox;

  ScanRepositoryImpl(this.transactionsBox);

  @override
  Future<List<Transaksi>> processImage(File imageFile) async {
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
                    'Tanggal transaksi. WAJIB dalam format DateTime flutter agar dapat di-parse.',
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

    final response = await model.generateContent([
      Content.multi([prompt, imagePart]),
    ]);

    final jsonResponse = jsonDecode(response.text!);
    final List<dynamic> transactionsJson = jsonResponse['transactions'];
    final List<Transaksi> transactions = transactionsJson
        .map((json) => Transaksi.fromJson(json))
        .toList();

    return transactions;
  }

  @override
  Future<void> saveTransactions(List<Transaksi> transactions) async{
    try {
      for (var element in transactions) {
        await transactionsBox.put(element.id, element);
      }
    } catch (e) {
      throw Exception('Failed to save transactions: $e');
    }
  }
}
