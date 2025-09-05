import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';

import '../../domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<Map<String, dynamic>> getResponse(String prompt) async {
    final jsonSchema = Schema.object(
      properties: {
        'isTransaction': Schema.boolean(
          description:
              'True jika pesan pengguna adalah tentang mencatat transaksi keuangan, false jika sebaliknya.',
        ),
        'transaction': Schema.object(
          description:
              'Objek transaksi, hanya ada jika isTransaction true. Jika tidak, kembalikan null.',
          properties: {
            'name': Schema.string(
              description: 'Nama barang atau jasa dari transaksi.',
            ),
            'amount': Schema.number(description: 'Jumlah nominal transaksi.'),
            'category': Schema.enumString(
              description: 'Kategori transaksi yang paling sesuai.',
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
        'replyMessage': Schema.string(
          description: 'Pesan balasan untuk ditampilkan kepada pengguna.',
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

    final fullPrompt = Content.text('''
      Analisis pesan pengguna. Tentukan apakah ini adalah permintaan untuk mencatat transaksi keuangan atau pertanyaan umum.

      Jika ini adalah transaksi (misalnya, "beli kopi 25.000", "gaji bulanan 5.000.000"), set 'isTransaction' ke true, ekstrak nama, jumlah, dan kategori yang sesuai, lalu buat pesan balasan konfirmasi seperti "Kopi 25.000 berhasil dicatat!". Kategori harus salah satu dari: 'Makanan & Minuman', 'Investasi', 'Laundry', 'Belanja', 'Uang Masuk'. Default ke 'Belanja' jika tidak yakin. Jika pengguna menyebutkan pemasukan seperti 'gaji' atau apapun itu yang berkaitan dengan pemasukan, gunakan kategori 'Uang Masuk'.
      
      Jika ini adalah pertanyaan umum (misalnya, "bagaimana cara mengelola keuangan?", "halo"), set 'isTransaction' ke false, biarkan 'transaction' null, dan berikan jawaban yang membantu sebagai 'replyMessage'. Jawaban yang anda berikan kaitkanlah dengan hal keuangan dan manajemen keuangan.

      Pesan pengguna: "$prompt"
      ''');

    try {
      final response = await model.generateContent([fullPrompt]);
      return jsonDecode(response.text!);
    } catch (e) {
      return {
        'isTransaction': false,
        'transaction': null,
        'replyMessage': 'Maaf, saya tidak mengerti. Bisa coba lagi?',
      };
    }
  }
}
