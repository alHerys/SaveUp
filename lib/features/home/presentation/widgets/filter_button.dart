import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onTapPengeluaran;
  final VoidCallback onTapPemasukan;
  const FilterButton({
    super.key,
    required this.onTapPengeluaran,
    required this.onTapPemasukan,
  });

  @override
  Widget build(BuildContext context) {
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
                  color: AppPallete.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  'Pengeluaran',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallete.baseWhite /* White */,
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
                decoration: BoxDecoration(
                  color: AppPallete.baseWhite,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  'Pemasukan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallete.baseBlack /* White */,
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
