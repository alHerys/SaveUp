import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class HomeAnggaran extends StatelessWidget {
  const HomeAnggaran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Anggaran',
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
        Column(
          spacing: 16,
          children: List.generate(
            3,
            (index) => Container(
              padding: EdgeInsets.all(13),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: AppPallete.baseWhite,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: AppPallete.textSecondary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    spacing: 11,
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Pizza.svg',
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Makan dan minum',
                            style: TextStyle(
                              color: AppPallete.baseBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.start,
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
                            spacing: 5,
                            children: [
                              Text(
                                'Bulanan',
                                style: TextStyle(
                                  color: AppPallete
                                      .textPrimary,
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.w400,
                                ),
                              ),
                              Container(
                                width: 4,
                                height: 4,
                                decoration: ShapeDecoration(
                                  color: AppPallete
                                      .textPrimary,
                                  shape: OvalBorder(),
                                ),
                              ),
                              Text(
                                '31 Januari - 1 Maret',
                                style: TextStyle(
                                  color: AppPallete
                                      .textPrimary,
                                  fontSize: 10,
                                  fontWeight:
                                      FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3.0,
                    ),
                    child: Divider(
                      thickness: 0.8,
                      color: AppPallete.baseBlack,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 67),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Anggaran ',
                              style: TextStyle(
                                color: AppPallete.baseBlack,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Rp 750.000',
                              style: TextStyle(
                                color: AppPallete.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sisa ',
                              style: TextStyle(
                                color: AppPallete.baseBlack,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Rp 750.000',
                              style: TextStyle(
                                color: AppPallete.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor:
                            AppPallete.progressBackground,
                        color: AppPallete.primary,
                        minHeight: 15,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '10%',
                            style: TextStyle(
                              color: AppPallete.baseBlack,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
