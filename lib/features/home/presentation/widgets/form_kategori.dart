import 'package:flutter/material.dart';

class FormKategori extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String> onCategoryChanged;

  const FormKategori({
    super.key,
    required this.selectedValue,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategori',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 12,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 40,
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            items: [
              'Makanan & Minuman',
              'Investasi',
              'Laundry',
              'Belanja',
              'Uang Masuk',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(fontSize: 12)),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                onCategoryChanged(newValue);
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}