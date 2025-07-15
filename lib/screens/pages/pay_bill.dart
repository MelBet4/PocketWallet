import 'package:flutter/material.dart';

class PayTheBillPage extends StatefulWidget {
  const PayTheBillPage({super.key});

  @override
  _PayTheBillPageState createState() => _PayTheBillPageState();
}

class _PayTheBillPageState extends State<PayTheBillPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _billNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _selectedBillType = 'Electricity'; // Default selection

  @override
  void dispose() {
    _billNumberController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _payBill() {
    if (_formKey.currentState!.validate()) {
      String billNumber = _billNumberController.text;
      String amount = _amountController.text;
      String billType = _selectedBillType;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Paying $amount for $billType to bill number $billNumber'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F3F), // Dark blue background
      appBar: AppBar(
        title: const Text('Pay the Bill', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDropdownField(),
              const SizedBox(height: 20),
              _buildTextField(_billNumberController, 'Bill Number'),
              const SizedBox(height: 20),
              _buildTextField(_amountController, 'Amount'),
              const SizedBox(height: 30),
              _buildPayButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a dropdown field for bill type selection
  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue[700], // Background similar to input fields
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedBillType,
          dropdownColor: Colors.blue[700],
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          items: ['Electricity', 'Water', 'Internet', 'Rent'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedBillType = newValue!;
            });
          },
        ),
      ),
    );
  }

  /// Builds a rounded input field
  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue[700], // Dark blue input background
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  /// Builds the "Pay Bill" button
  Widget _buildPayButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _payBill,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange, // Orange button
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('Pay Bill', style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}