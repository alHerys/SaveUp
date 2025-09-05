import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/scan/presentation/cubit/review/review_cubit.dart';

class EditTransactionWidget extends StatelessWidget {
  const EditTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dengarkan hanya pada state ReviewEditing
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is! ReviewEditing) {
          // Jika state bukan editing, jangan tampilkan apa-apa.
          // Ini untuk mencegah error saat dialog ditutup.
          return const SizedBox.shrink();
        }

        final transactionToEdit = state.transactionToEdit;
        final reviewCubit = context.read<ReviewCubit>();

        return AlertDialog(
          title: const Text('Edit Transaksi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nama', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: transactionToEdit.name,
                  onChanged: (value) => reviewCubit.updateEditingField(name: value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nama Transaksi',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Harga', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: transactionToEdit.amount.toStringAsFixed(0),
                  onChanged: (value) => reviewCubit.updateEditingField(amount: value),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Jumlah Nominal',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: transactionToEdit.category,
                  items: const [
                    DropdownMenuItem<String>(value: 'Makanan & Minuman', child: Text('Makanan & Minuman')),
                    DropdownMenuItem<String>(value: 'Investasi', child: Text('Investasi')),
                    DropdownMenuItem<String>(value: 'Laundry', child: Text('Laundry')),
                    DropdownMenuItem<String>(value: 'Belanja', child: Text('Belanja')),
                    DropdownMenuItem<String>(value: 'Uang Masuk', child: Text('Uang Masuk')),
                  ],
                  onChanged: (newValue) {
                    if (newValue != null) {
                      reviewCubit.updateEditingField(category: newValue);
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                reviewCubit.cancelEdit();
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                reviewCubit.saveEdit();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPallete.primary,
                foregroundColor: AppPallete.baseWhite,
              ),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}