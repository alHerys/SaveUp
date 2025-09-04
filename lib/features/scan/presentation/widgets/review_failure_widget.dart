import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/scan/presentation/pages/scan_page/scan_bloc.dart';

class ReviewFailureWidget extends StatelessWidget {
  final ScanEventFailure state;
  const ReviewFailureWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Scan Struk',
          style: TextStyle(
            color: AppPallete.baseWhite,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: AppPallete.baseWhite),
        ),
      ),
      body: Center(
        child: Text(
          state.message,
          style: TextStyle(
            color: AppPallete.baseBlack,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
