import 'package:flutter/material.dart';
import 'package:save_up/core/themes/app_pallete.dart';
import 'package:save_up/features/home/presentation/widgets/filter_button.dart';
import 'package:save_up/features/home/presentation/widgets/tambah_transaksi_button.dart';

class TambahTransaksi extends StatelessWidget {
  const TambahTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tambah Transaksi',
          style: TextStyle(
            color: AppPallete.baseBlack,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 30,
          children: [
            FilterButton(onTapPengeluaran: () {}, onTapPemasukan: () {}),
            Column(
              spacing: 30,
              children: [
                FormJumlah(),
                FormKategori(),
                FormTanggal(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: TambahTransaksiButton(onTap: () {}),
    );
  }
}

class FormTanggal extends StatelessWidget {
  const FormTanggal({
    super.key,
  });

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
            keyboardType: TextInputType.datetime,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
            },
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
                onPressed: () {},
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

class FormKategori extends StatelessWidget {
  const FormKategori({super.key});

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
          child: DropdownButtonFormField(
            items: [
                'Makanan & Minuman',
                'Investasi',
                'Laundry',
                'Belanja',
                'Uang Masuk',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            onChanged: (_) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hint: Text(
                'Makanan & Minuman',
                style: TextStyle(
                  color: AppPallete.textPrimary /* Text-Primary-text */,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FormJumlah extends StatelessWidget {
  const FormJumlah({super.key});

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
                onPressed: () {},
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
