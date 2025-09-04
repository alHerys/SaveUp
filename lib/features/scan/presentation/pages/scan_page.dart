import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/themes/loader.dart';
import 'package:save_up/features/scan/presentation/bloc_scan/scan_bloc.dart';
import 'package:save_up/features/scan/presentation/widgets/scan_bottom_button.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocConsumer<ScanBloc, ScanState>(
        listener: (context, state) {
          if (state is ScanImageSuccess) {}
        },
        builder: (BuildContext context, ScanState state) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      'Scan atau upload struk belanja',
                      style: TextStyle(
                        color: AppPallete.baseWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  state is ScanImageLoading ? SizedBox() : ScanBottomButton(),
                ],
              ),
              state is ScanImageLoading ? Loader() : SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
