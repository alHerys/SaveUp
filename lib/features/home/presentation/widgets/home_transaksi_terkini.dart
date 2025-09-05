import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/utils/currency_format.dart';
import 'package:save_up/features/home/presentation/cubit/transaction/transaction_cubit.dart';

class HomeTransaksiTerkini extends StatelessWidget {
  const HomeTransaksiTerkini({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaksi terkini',
              style: TextStyle(
                color: AppPallete.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Detail',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppPallete.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TransactionError) {
              return Center(child: Text(''));
            }
            if (state is TransactionRetrived && state.transactions.isEmpty) {
              return const Center(
                child: Text(
                  'Belum ada transaksi',
                  style: TextStyle(
                    color: AppPallete.textSecondary,
                    fontSize: 14,
                  ),
                ),
              );
            }

            if (state is TransactionRetrived) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x140D0A2C),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.transactions.length > 4
                      ? 4
                      : state.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = state.transactions[index];
                    final formattedDate = DateFormat('EEEE, d MMMM yyyy')
                        .format(
                          transaction.date,
                        ); // Assuming date is a DateTime object
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 16,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/Food Category.svg',
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 10,
                                  children: [
                                    Text(
                                      transaction.name,
                                      style: TextStyle(
                                        color: AppPallete.textPrimary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      formattedDate,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppPallete.textSecondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '- ${CurrencyFormat.convertToIdr(transaction.amount, 0)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppPallete.semanticRed,
                                fontSize: 12,
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        if (index <
                            (state.transactions.length > 4
                                ? 3
                                : state.transactions.length - 1))
                          const Divider(thickness: 1),
                      ],
                    );
                  },
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
