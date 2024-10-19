import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String fromCurrency = 'INR';
  String toCurrency = 'USD';
  double amount = 0.0;
  double convertedAmount = 0.0;

  // Example conversion rates
  final Map<String, double> exchangeRates = {
    'INR': 1.0, // Base currency
    'USD': 0.012, // Example rate: 1 INR = 0.012 USD
    'EUR': 0.011, // Example rate: 1 INR = 0.011 EUR
    // Add more currencies as needed
  };

  void convertCurrency() {
    if (exchangeRates[fromCurrency] != null && exchangeRates[toCurrency] != null) {
      setState(() {
        convertedAmount = amount * (exchangeRates[toCurrency]! / exchangeRates[fromCurrency]!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.white], // Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( // Allow scrolling for smaller screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Convert your currency',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // From Currency Dropdown
              _buildCurrencyDropdown('From', fromCurrency, (newValue) {
                setState(() {
                  fromCurrency = newValue!;
                });
              }),

              // Amount Input
              _buildAmountInput(),

              // To Currency Dropdown
              _buildCurrencyDropdown('To', toCurrency, (newValue) {
                setState(() {
                  toCurrency = newValue!;
                });
              }),

              SizedBox(height: 20),

              // Convert Button
              ElevatedButton(
                onPressed: convertCurrency,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Convert'),
              ),

              SizedBox(height: 20),

              // Converted Amount Display
              Text(
                'Converted Amount: ${convertedAmount.toStringAsFixed(2)} $toCurrency',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Currency Dropdown
  Widget _buildCurrencyDropdown(String label, String currentValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label Currency',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blueAccent),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<String>(
            value: currentValue,
            isExpanded: true,
            underline: SizedBox(), // Remove the underline
            onChanged: onChanged,
            items: exchangeRates.keys.map<DropdownMenuItem<String>>((String currency) {
              return DropdownMenuItem<String>(
                value: currency,
                child: Text(currency),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // Widget for Amount Input
  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blueAccent),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter amount',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            amount = double.tryParse(value) ?? 0.0;
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
