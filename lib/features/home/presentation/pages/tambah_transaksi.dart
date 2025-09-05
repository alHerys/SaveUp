import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/home/presentation/cubit/add_transaction/add_transaction_cubit.dart';
import 'package:save_up/features/home/presentation/widgets/filter_button.dart';
import 'package:save_up/features/home/presentation/widgets/form_jumlah.dart';
import 'package:save_up/features/home/presentation/widgets/form_kategori.dart';
import 'package:save_up/features/home/presentation/widgets/form_nama.dart';
import 'package:save_up/features/home/presentation/widgets/form_tanggal.dart';
import 'package:save_up/features/home/presentation/widgets/tambah_transaksi_button.dart';

class TambahTransaksi extends StatefulWidget {
  const TambahTransaksi({super.key});

  @override
  State<TambahTransaksi> createState() => _TambahTransaksiState();
}

class _TambahTransaksiState extends State<TambahTransaksi> {
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  String _selectedCategory = 'Makanan & Minuman';
  DateTime _selectedDate = DateTime.now();
  TransactionType _selectedTransactionType = TransactionType.pengeluaran;

  String _getMonthName(int month) {
    const monthNames = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return monthNames[month - 1];
  }

  @override
  void initState() {
    super.initState();
    _tanggalController.text =
        '${_selectedDate.day} ${_getMonthName(_selectedDate.month)} ${_selectedDate.year}';
  }

  @override
  void dispose() {
    _namaController.dispose();
    _jumlahController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tambah Transaksi',
          style: TextStyle(
            color: AppPallete.baseBlack,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocListener<AddTransactionCubit, AddTransactionState>(
        listener: (context, state) {
          if (state is AddTransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Transaksi berhasil ditambahkan!')),
            );
          } else if (state is AddTransactionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Maaf coba lagi nanti')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FilterButton(
                  selectedType: _selectedTransactionType,
                  onTapPengeluaran: () {
                    setState(() {
                      _selectedTransactionType = TransactionType.pengeluaran;
                    });
                  },
                  onTapPemasukan: () {
                    setState(() {
                      _selectedTransactionType = TransactionType.pemasukan;
                    });
                  },
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    FormNama(controller: _namaController),
                    const SizedBox(height: 30),
                    FormJumlah(controller: _jumlahController),
                    const SizedBox(height: 30),
                    if (_selectedTransactionType == TransactionType.pengeluaran)
                      FormKategori(
                        selectedValue: _selectedCategory,
                        onCategoryChanged: (String value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                    if (_selectedTransactionType == TransactionType.pengeluaran)
                      const SizedBox(height: 30),
                    FormTanggal(
                      controller: _tanggalController,
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null && picked != _selectedDate) {
                          setState(() {
                            _selectedDate = picked;
                            _tanggalController.text =
                                '${_selectedDate.day} ${_getMonthName(_selectedDate.month)} ${_selectedDate.year}';
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TambahTransaksiButton(
          onTap: () {
            final amount = double.tryParse(_jumlahController.text);
            if (amount != null &&
                _namaController.text.isNotEmpty &&
                (_selectedTransactionType == TransactionType.pemasukan ||
                    _selectedCategory.isNotEmpty)) {
              final isPengeluaran =
                  _selectedTransactionType == TransactionType.pengeluaran;

              context.read<AddTransactionCubit>().addTransaction(
                name: _namaController.text,
                amount: amount,
                category: isPengeluaran ? _selectedCategory : 'Uang Masuk',
                date: _selectedDate,
                isPengeluaran: isPengeluaran,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Semua field harus diisi')),
              );
            }
          },
        ),
      ),
    );
  }
}
