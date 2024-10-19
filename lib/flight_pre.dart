// flight_prediction_page.dart

import 'dart:convert';  // For encoding/decoding JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FlightPredictionPage extends StatefulWidget {
  @override
  _FlightPredictionPageState createState() => _FlightPredictionPageState();
}

class _FlightPredictionPageState extends State<FlightPredictionPage> {
  String predictedPrice = '';
  final originController = TextEditingController();
  final destinationController = TextEditingController();
  final departureDateController = TextEditingController();

  // Method to send a POST request
  Future<void> fetchPrediction() async {
    // Use the local URL based on your environment (for emulator/physical device)
    const String url = 'https://5bb6-2409-40f4-204f-851b-6570-2772-c4b0-6477.ngrok-free.app/predict';  // For Emulator

    // Construct the input data for the POST request
    Map<String, dynamic> inputData = {
      'origin': originController.text,
      'destination': destinationController.text,
      'departure_date': departureDateController.text,
    };

    try {
      // Send POST request to the Flask API
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(inputData),  // Send inputData as JSON
      );

      // Check for successful response
      if (response.statusCode == 200) {
        // Parse JSON response
        final data = json.decode(response.body);

        // Update UI with the predicted price
        setState(() {
          predictedPrice = data['predicted_price'].toString();
        });
      } else {
        // If the server returns an error status code
        setState(() {
          predictedPrice = 'Failed to fetch prediction. Status Code: ${response.statusCode}';
        });
      }
    } catch (e) {
      // Handle errors during the request
      setState(() {
        predictedPrice = 'Error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flight Price Prediction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: originController,
              decoration: InputDecoration(labelText: 'Origin Airport'),
            ),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(labelText: 'Destination Airport'),
            ),
            TextField(
              controller: departureDateController,
              decoration: InputDecoration(labelText: 'Departure Date (YYYY-MM-DD)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchPrediction,  // Call the POST request method when button is pressed
              child: Text('Get Prediction'),
            ),
            SizedBox(height: 20),
            Text(
              'Predicted Price: $predictedPrice',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
