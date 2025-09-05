import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class FormJumlah extends StatelessWidget {
  final TextEditingController controller;
  const FormJumlah({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jumlah',
          style: TextStyle(
            color: const Color(0xFF333333) /* Text-Primary-text */,
            fontSize: 12,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 12),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: Icon(Icons.cancel_outlined),
              ),

              hint: Text(
                '20.000',
                style: TextStyle(
                  color: AppPallete.textPrimary /* Text-Primary-text */,
                  fontSize: 10,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
