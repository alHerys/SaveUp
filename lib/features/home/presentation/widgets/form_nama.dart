import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';

class FormNama extends StatelessWidget {
  final TextEditingController controller;
  const FormNama({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama',
          style: TextStyle(
            color: const Color(0xFF333333) /* Text-Primary-text */,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 12),
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
                'Makan Bakso',
                style: TextStyle(
                  color: AppPallete.textPrimary /* Text-Primary-text */,
                  fontSize: 10,
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
