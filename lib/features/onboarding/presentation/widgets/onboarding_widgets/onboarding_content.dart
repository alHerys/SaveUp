import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/themes/app_text_style.dart';

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
          style: AppTextStyle.plusJakartaSans24w700.copyWith(
            color: AppPallete.primary,
          ),
        ),
    
        SvgPicture.asset(imagePath),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.5),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyle.plusJakartaSans16w400.copyWith(
              color: AppPallete.textPrimary,
            ),
          ),
        ),
        SizedBox(height: 53.8,)
      ],
    );
  }
}
