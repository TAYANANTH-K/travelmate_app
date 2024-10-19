import 'package:flutter/material.dart';
import 'flight_pre.dart'; // Ensure this imports the correct file

class PredictionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Price Prediction'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Title
            Text(
              'Choose a Prediction Type',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Row of prediction options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPredictionOption(
                  icon: Icons.flight_takeoff,
                  label: 'Flight Prediction',
                  onTap: () {
                    // Make sure to use the correct class name here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlightPredictionPage()), // Fixed class name
                    );
                  },
                ),
                _buildPredictionOption(
                  icon: Icons.hotel,
                  label: 'Hotel Prediction',
                  onTap: () {
                    // Navigate to hotel prediction page
                  },
                ),
                _buildPredictionOption(
                  icon: Icons.directions_car,
                  label: 'Car Rental Prediction',
                  onTap: () {
                    // Navigate to car rental prediction page
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create prediction options
  Widget _buildPredictionOption({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        width: 100, // Fixed width for uniformity
        height: 100, // Fixed height for uniformity
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
