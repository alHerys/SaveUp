// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/scan/presentation/cubit/review/review_cubit.dart';
import 'package:save_up/features/scan/presentation/cubit/scan/scan_cubit.dart';
import 'package:save_up/features/scan/presentation/widgets/edit_transaction_widget.dart';
import 'package:save_up/features/scan/presentation/widgets/gemini_loader_widget.dart';
import 'package:save_up/features/scan/presentation/widgets/review_failure_widget.dart';
import 'package:save_up/features/scan/presentation/widgets/review_save_button.dart';
import 'package:save_up/features/scan/presentation/widgets/transaksi_review_widget.dart';

class ReviewPage extends StatefulWidget {
  final File imageFile;
  const ReviewPage({super.key, required this.imageFile});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
    context.read<ScanCubit>().processImageInGemini(widget.imageFile);
  }

  // Method untuk menampilkan dialog
  void _showEditPopup(BuildContext context, int index) {
    // 1. Beritahu cubit untuk masuk ke mode edit
    context.read<ReviewCubit>().startEditing(index);

    showDialog(
      context: context,
      barrierColor: AppPallete.backgroundColor.withOpacity(0.5),
      // 2. Berikan instance ReviewCubit yang sama ke dalam pop-up
      builder: (_) => BlocProvider.value(
        value: context.read<ReviewCubit>(),
        child: const EditTransactionWidget(),
      ),
    ).then((_) {
      // 3. (Opsional) Batalkan mode edit jika dialog ditutup dengan cara lain
      final currentState = context.read<ReviewCubit>().state;
      if (currentState is ReviewEditing) {
        context.read<ReviewCubit>().cancelEdit();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is GeminiProcessingImageSuccess) {
          context.read<ReviewCubit>().loadReviewTransactions(
            state.daftarTransaksi,
          );
        }
      },
      builder: (context, state) {
        if (state is GeminiProcessingImageLoading) {
          return GeminiLoaderWidget(widget: widget);
        }
        if (state is ScanEventFailure) {
          return ReviewFailureWidget();
        }

        return BlocConsumer<ReviewCubit, ReviewState>(
          listener: (context, state) {
            if (state is ReviewSaveSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/transaksi-terkini',
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is ReviewRetrived) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  title: Text(
                    'Review Transaksi',
                    style: TextStyle(
                      color: AppPallete.baseBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0,
                    ),
                    child: Column(
                      spacing: 16,
                      children: List.generate(state.transactions.length, (
                        index,
                      ) {
                        return Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: TransaksiReviewWidget(
                                name: state.transactions[index].name,
                                category: state.transactions[index].category,
                                amount: state.transactions[index].amount,
                                onEditTap: () => _showEditPopup(context, index),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                bottomNavigationBar: ReviewSaveButton(
                  onTap: () {
                    context.read<ReviewCubit>().saveTransaction(
                      state.transactions,
                    );
                  },
                ),
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
