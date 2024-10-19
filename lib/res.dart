import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // To open navigation apps

class Restaurant {
  final String name;
  final List<String> menu;
  final double priceRange;
  final LatLng location; // Add location attribute

  Restaurant({
    required this.name,
    required this.menu,
    required this.priceRange,
    required this.location, // Add location to constructor
  });
}

class RestaurantGuidePage extends StatefulWidget {
  @override
  _RestaurantGuidePageState createState() => _RestaurantGuidePageState();
}

class _RestaurantGuidePageState extends State<RestaurantGuidePage> {
  String _destination = '';
  double _amount = 0.0;
  List<Restaurant> _suggestedRestaurants = [];

  // Example list of restaurants with location
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: 'Spice Junction',
      menu: ['Butter Chicken', 'Naan', 'Biryani'],
      priceRange: 500,
      location: LatLng(12.9716, 77.5946), // Example coordinates for Bangalore
    ),
    Restaurant(
      name: 'Ocean Breeze',
      menu: ['Grilled Fish', 'Pasta', 'Salad'],
      priceRange: 800,
      location: LatLng(12.2958, 76.6396), // Example coordinates for Mysore
    ),
    Restaurant(
      name: 'Veg Delight',
      menu: ['Paneer Tikka', 'Dosa', 'Veg Biryani'],
      priceRange: 300,
      location: LatLng(11.0168, 76.9558), // Example coordinates for Coimbatore
    ),
  ];

  void _getRestaurantSuggestions() {
    setState(() {
      _suggestedRestaurants = _restaurants
          .where((restaurant) => restaurant.priceRange <= _amount)
          .toList();
    });
  }

  void _openMap(LatLng location) async {
    final url = 'https://www.google.com/maps/dir/?api=1&destination=${location.latitude},${location.longitude}';
    if (await canLaunch(url)) {
      await launch(url); // Open Google Maps for navigation
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Guide'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Destination Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _destination = value;
              },
            ),
            SizedBox(height: 16),

            // Amount Input
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Budget (₹)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _amount = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 16),

            // Suggest Button
            ElevatedButton(
              onPressed: _getRestaurantSuggestions,
              child: Text('Suggest Restaurants'),
            ),
            SizedBox(height: 16),

            // Suggested Restaurants
            Expanded(
              child: _suggestedRestaurants.isEmpty
                  ? Text('No restaurants available within your budget.')
                  : ListView.builder(
                itemCount: _suggestedRestaurants.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      onTap: () => _openMap(_suggestedRestaurants[index].location), // Open map on tap
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _suggestedRestaurants[index].name,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text('Menu:'),
                            for (String menuItem in _suggestedRestaurants[index].menu)
                              Text('- $menuItem'),
                          ],
                        ),
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
