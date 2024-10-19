import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this dependency in pubspec.yaml

class EmergencyCallPage extends StatefulWidget {
  @override
  _EmergencyCallPageState createState() => _EmergencyCallPageState();
}

class _EmergencyCallPageState extends State<EmergencyCallPage> {
  String selectedCountry = 'India';

  final Map<String, List<Map<String, String>>> emergencyNumbersByCountry = {
    'India': [
      {'name': 'Police', 'number': '100'},
      {'name': 'Fire Department', 'number': '101'},
      {'name': 'Ambulance', 'number': '108'},
      {'name': 'National Disaster Response Force (NDRF)', 'number': '112'},
      {'name': 'Women Helpline', 'number': '181'},
      {'name': 'Child Helpline', 'number': '1098'},
    ],
    'USA': [
      {'name': 'Police', 'number': '911'},
      {'name': 'Fire Department', 'number': '911'},
      {'name': 'Ambulance', 'number': '911'},
      {'name': 'Poison Control', 'number': '1-800-222-1222'},
      {'name': 'National Suicide Prevention Lifeline', 'number': '1-800-273-8255'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Services'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCountry,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue!;
                });
              },
              items: emergencyNumbersByCountry.keys
                  .map<DropdownMenuItem<String>>((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emergencyNumbersByCountry[selectedCountry]!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(emergencyNumbersByCountry[selectedCountry]![index]['name']!),
                  subtitle: Text(emergencyNumbersByCountry[selectedCountry]![index]['number']!),
                  trailing: IconButton(
                    icon: Icon(Icons.call, color: Colors.blue),
                    onPressed: () {
                      _makePhoneCall(emergencyNumbersByCountry[selectedCountry]![index]['number']!);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _makePhoneCall(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launch(launchUri.toString());
  }
}
