import 'package:flutter/material.dart';

class LocalGuidePage extends StatefulWidget {
  @override
  _LocalGuidePageState createState() => _LocalGuidePageState();
}

class _LocalGuidePageState extends State<LocalGuidePage> {
  // Sample guides data
  final List<Map<String, String>> allGuides = [
    {
      'name': 'John Doe',
      'location': 'Goa, India',
      'language': 'English, Hindi',
      'experience': '5 years',
      'rating': '4.8',
    },
    {
      'name': 'Sara Lee',
      'location': 'Paris, France',
      'language': 'French, English',
      'experience': '8 years',
      'rating': '4.9',
    },
    {
      'name': 'Liu Wei',
      'location': 'Beijing, China',
      'language': 'Mandarin, English',
      'experience': '3 years',
      'rating': '4.7',
    },
    {
      'name': 'Michael Smith',
      'location': 'New York, USA',
      'language': 'English, Spanish',
      'experience': '6 years',
      'rating': '4.6',
    },
    // Add more guide profiles here
  ];

  String? selectedLocation; // Holds the selected location
  List<Map<String, String>> filteredGuides = [];

  @override
  void initState() {
    super.initState();
    // Set default location to show guides
    selectedLocation = 'Goa, India';
    filterGuides(); // Filter based on default location
  }

  // Function to filter guides based on selected location
  void filterGuides() {
    setState(() {
      filteredGuides = allGuides
          .where((guide) => guide['location'] == selectedLocation)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Guide'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Find Local Guides to Assist You!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Dropdown for selecting location (simulating geolocation)
            DropdownButton<String>(
              value: selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  selectedLocation = newValue;
                  filterGuides(); // Filter guides based on the new selection
                });
              },
              items: <String>[
                'Goa, India',
                'Paris, France',
                'Beijing, China',
                'New York, USA'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // List of filtered guides based on selected location
            Expanded(
              child: ListView.builder(
                itemCount: filteredGuides.length,
                itemBuilder: (context, index) {
                  final guide = filteredGuides[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/guide_placeholder.png'), // Placeholder image
                        radius: 30,
                      ),
                      title: Text(guide['name']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location: ${guide['location']}'),
                          Text('Languages: ${guide['language']}'),
                          Text('Experience: ${guide['experience']}'),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 5),
                              Text(guide['rating']!,
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Add functionality to book or contact the guide
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Text('Contact'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
