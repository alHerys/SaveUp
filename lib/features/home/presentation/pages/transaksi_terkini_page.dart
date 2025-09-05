import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/utils/currency_format.dart';
import 'package:save_up/features/home/presentation/cubit/transaction/transaction_cubit.dart';

const List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'Mei',
  'Jun',
  'Jul',
  'Agt',
  'Sep',
  'Okt',
  'Nov',
  'Des',
];

class TransaksiTerkiniPage extends StatefulWidget {
  const TransaksiTerkiniPage({super.key});

  @override
  State<TransaksiTerkiniPage> createState() => _TransaksiTerkiniPageState();
}

class _TransaksiTerkiniPageState extends State<TransaksiTerkiniPage> {
  @override
  void initState() {
    super.initState();
    // Panggil cubit untuk memuat data saat halaman dibuka
    context.read<TransactionCubit>().groupLoadTransactionFromHive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Kembali ke halaman home
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text(
          'Transaksi Terkini',
          style: TextStyle(
            color: AppPallete.baseBlack,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        left: false,
        right: false,
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Widget untuk filter bulan (bisa diimplementasikan nanti)
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              months[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppPallete.primary,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -1.8,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 42,
                              ),
                              height: 4,
                              decoration: BoxDecoration(
                                color: AppPallete.primary,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 30),

              // Bagian untuk menampilkan daftar transaksi
              Expanded(
                child: BlocBuilder<TransactionCubit, TransactionState>(
                  builder: (context, state) {
                    if (state is TransactionLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is TransactionError) {
                      return const Center(child: Text('Gagal memuat data.'));
                    }
                    if (state is TransactionGrouped) {
                      final groupedTransactions = state.groupedTransactions;
                      if (groupedTransactions.isEmpty) {
                        return const Center(
                          child: Text('Belum ada transaksi.'),
                        );
                      }

                      // Ambil daftar tanggal (keys) dari map
                      final dates = groupedTransactions.keys.toList();

                      return ListView.builder(
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          final date = dates[index];
                          final transactionsOnDate = groupedTransactions[date]!;
                          final totalPengeluaran = transactionsOnDate
                              .fold<double>(
                                0,
                                (sum, item) => sum + item.amount,
                              );

                          return Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x140D0A2C),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                // Header Tanggal dan Total
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat(
                                        'd MMMM yyyy',
                                        'id_ID',
                                      ).format(date),
                                      style: const TextStyle(
                                        color: AppPallete.textSecondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '- ${CurrencyFormat.convertToIdr(totalPengeluaran, 0)}',
                                      style: const TextStyle(
                                        color: AppPallete.textSecondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                // Daftar transaksi pada tanggal tersebut
                                ...transactionsOnDate.map((transaction) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            switch (transaction.category) {
                                              'Makanan & Minuman' =>
                                                SvgPicture.asset(
                                                  'assets/icons/Food Category.svg',
                                                ),
                                              'Investasi' => SvgPicture.asset(
                                                'assets/icons/Money Category.svg',
                                              ),
                                              'Laundry' => SvgPicture.asset(
                                                'assets/icons/Laundry Category.svg',
                                              ),
                                              'Belanja' => SvgPicture.asset(
                                                'assets/icons/Shopping Category.svg',
                                              ),
                                              _ => SvgPicture.asset(
                                                'assets/icons/Money Cateogry.svg',
                                              ),
                                            },
                                            const SizedBox(width: 16),
                                            Text(
                                              transaction.name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xFF333333),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '- ${CurrencyFormat.convertToIdr(transaction.amount, 0)}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Color(0xFFEA4335),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
