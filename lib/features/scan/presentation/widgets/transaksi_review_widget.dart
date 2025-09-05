import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/utils/currency_format.dart';

class TransaksiReviewWidget extends StatelessWidget {
  final String name;
  final String category;
  final double amount;
  final VoidCallback onEditTap;
  const TransaksiReviewWidget({
    super.key,
    required this.name,
    required this.category,
    required this.amount,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFD3D3D3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              spacing: 16,
              children: [
                GestureDetector(
                  onTap: onEditTap,
                  child: SvgPicture.asset('assets/icons/Edit.svg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: AppPallete.baseBlack,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: AppPallete.baseBlack,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            CurrencyFormat.convertToIdr(amount, 0),
            style: TextStyle(
              color: const Color(0xFFFF0000),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
