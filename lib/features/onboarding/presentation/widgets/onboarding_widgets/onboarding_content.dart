import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 120,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppPallete.primary /* Main-Color */,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),

        SvgPicture.asset(imagePath),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.5),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPallete.textPrimary /* Text-Primary-text */,
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 53.8),
      ],
    );
  }
}
