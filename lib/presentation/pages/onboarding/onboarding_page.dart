import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/core/themes/app_text_style.dart';
import 'package:save_up/presentation/widgets/onboarding_widgets/onboarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Lewati',
                style: AppTextStyle.plusJakartaSans16w700.copyWith(
                  color: AppPallete.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            children: [
              PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  OnboardingContent(
                    title: 'Budget Track',
                    imagePath: 'assets/images/Bar Chart Onboarding.svg',
                    description:
                        'Mulai mencatat semua transaksi keuangan secara otomatis, dan akses laporan keuangan kapan saja.',
                  ),

                  OnboardingContent(
                    title: 'Scan Struk',
                    imagePath: 'assets/images/Scan Onboarding.svg',
                    description:
                        'Dengan satu kali pemindaian, detail transaksi langsung tercatat di sistem, tanpa perlu input manual.',
                  ),

                  OnboardingContent(
                    title: 'Assistant Chatbot',
                    imagePath: 'assets/images/Chat Bot Onb.svg',
                    description:
                        'Kirimkan informasi transaksi, dan chatbot akan mencatatnya langsung ke sistem, menjaga keuanganmu tetap terorganisir tanpa perlu repot.',
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotColor: AppPallete.secondary,
                      activeDotColor: AppPallete.primary,
                      dotHeight: 13,
                      expansionFactor: 2.8,
                    ),
                  ),

                  SizedBox(height: 35),
                ],
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.page != 2) {
            controller.nextPage(
              duration: const Duration(milliseconds: 350),
              curve: Curves.linear,
            );
          } else {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        },

        shape: const CircleBorder(),
        backgroundColor: AppPallete.primary,

        child: Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }
}
