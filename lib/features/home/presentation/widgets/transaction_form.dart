import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Enum untuk menentukan tipe transaksi
enum TransactionType { pemasukan, pengeluaran }

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  String? _selectedCategory = 'Makanan & Minuman';
  DateTime _selectedDate = DateTime.now();

  // Ganti nilai variabel ini untuk melihat perubahan pada UI
  TransactionType _currentType = TransactionType.pengeluaran;

  @override
  void initState() {
    super.initState();
    _tanggalController.text = DateFormat(
      'd MMMM yyyy',
      'id_ID',
    ).format(_selectedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _tanggalController.text = DateFormat(
          'd MMMM yyyy',
          'id_ID',
        ).format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            label: 'Jumlah',
            controller: _jumlahController,
            hint: '20.000',
            keyboardType: TextInputType.number,
          ),

          if (_currentType == TransactionType.pengeluaran) ...[
            const SizedBox(height: 16),
            _buildCategoryDropdown(),
          ],

          const SizedBox(height: 16),

          _buildDateField(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () => controller.clear(),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kategori',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedCategory,
          items:
              [
                'Makanan & Minuman',
                'Investasi',
                'Laundry',
                'Belanja',
                'Uang Masuk',
              ].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tanggal',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _tanggalController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime.now();
                  _tanggalController.text = DateFormat(
                    'd MMMM yyyy',
                    'id_ID',
                  ).format(_selectedDate);
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _jumlahController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }
}
