import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class FormTanggal extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  const FormTanggal({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal',
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
            readOnly: true,
            controller: controller,
            style: const TextStyle(fontSize: 12),
            keyboardType: TextInputType.datetime,
            onTap: onTap,
            decoration: InputDecoration(
              hint: Text(
                '12 Juni 2025',
                style: TextStyle(
                  color: AppPallete.textPrimary,
                  fontSize: 10,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: controller.clear,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
