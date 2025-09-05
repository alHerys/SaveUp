import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

enum TransactionType { pengeluaran, pemasukan }

class FilterButton extends StatelessWidget {
  final TransactionType selectedType;
  final VoidCallback onTapPengeluaran;
  final VoidCallback onTapPemasukan;

  const FilterButton({
    super.key,
    required this.selectedType,
    required this.onTapPengeluaran,
    required this.onTapPemasukan,
  });

  @override
  Widget build(BuildContext context) {
    bool isPengeluaran = selectedType == TransactionType.pengeluaran;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.baseBlack),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTapPengeluaran,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isPengeluaran ? AppPallete.primary : AppPallete.baseWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  'Pengeluaran',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isPengeluaran ? AppPallete.baseWhite : AppPallete.baseBlack,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTapPemasukan,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: !isPengeluaran ? AppPallete.primary : AppPallete.baseWhite,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  'Pemasukan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !isPengeluaran ? AppPallete.baseWhite : AppPallete.baseBlack,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}