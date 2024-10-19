import 'package:flutter/material.dart';
import 'currency_converter_page.dart'; // Importing the CurrencyConverterPage
import 'pred.dart'; // Importing the PredictionPage
import 'local_guide_page.dart'; // Importing the Local Guide Page
import 'emergency_call_page.dart'; // Importing the EmergencyCallPage
import 'community_page.dart'; // Importing the CommunityPage
import 'res.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isChatbotVisible = false; // State to manage chatbot visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelMate'),
        backgroundColor: Colors.blueAccent,
        actions: [
          // Community Logo IconButton
          IconButton(
            icon: Icon(Icons.group, color: Colors.white), // Community icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityPage()), // Navigate to CommunityPage
              );
            },
          ),
          // Profile Icon with Dropdown Menu
          PopupMenuButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'), // Placeholder for profile image
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Column(
                  children: [
                    // Profile Image and Name
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Taya', // Replace with dynamic user name
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
                enabled: false,
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    // Navigate to profile page
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Travel History'),
                  onTap: () {
                    // Navigate to travel history page
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.assistant), // Local Guide icon
                  title: Text('Local Guide'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocalGuidePage()), // Navigate to Local Guide page
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.monetization_on), // Currency icon
                  title: Text('Currency Converter'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CurrencyConverterPage()),
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.help), // Emergency icon
                  title: Text('Emergency Services'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmergencyCallPage()), // Navigate to EmergencyCallPage
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Navigate to settings page
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for flights, hotels, etc.',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Travel Price Prediction Card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PredictionPage()), // Navigate to the PredictionPage
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.analytics, size: 40, color: Colors.orange), // Smaller icon
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Travel Price Prediction',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Predict future prices for flights, hotels, and car rentals.',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Find the best time to book!',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.orange),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Grid of booking options
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2,
                children: [
                  _buildBookingOption(
                    icon: Icons.flight_takeoff,
                    label: 'Book a Flight',
                    onTap: () {
                      // Navigate to flight booking page
                    },
                  ),
                  _buildBookingOption(
                    icon: Icons.directions_bus,
                    label: 'Book a Bus',
                    onTap: () {
                      // Navigate to bus booking page
                    },
                  ),
                  _buildBookingOption(
                    icon: Icons.hotel,
                    label: 'Reserve a Hotel',
                    onTap: () {
                      // Navigate to hotel reservation page
                    },
                  ),
                  _buildBookingOption(
                    icon: Icons.directions_car,
                    label: 'Car Rentals',
                    onTap: () {
                      // Navigate to car rentals page
                    },
                  ),
                  _buildBookingOption(
                    icon: Icons.local_offer,
                    label: 'deals and Offer',
                    onTap: () {
                      // Navigate to offer trips page
                    },
                  ),
                  _buildBookingOption(
                    icon: Icons.restaurant, // Using restaurant icon
                    label: 'Restaurant Guide', // Suggested name
                    onTap: () {
                      // Navigate to the RestaurantGuidePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RestaurantGuidePage()),
                      );
                    },
                  ),

                ],
              ),
            ),
            SizedBox(height: 20),

            // Locations Section
            Text(
              'Popular Travel Locations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Grid of locations
            Container(
              height: 140,
              color: Colors.white,
              child: GridView.count(
                crossAxisCount: 3, // Three items per row
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  _buildLocationOption('assets/tamilnadu.jpg', 'Tamil Nadu'),
                  _buildLocationOption('assets/maharasthra.jpg', 'Mumbai'),
                  _buildLocationOption('assets/mahars.jpg', 'Maharashtra'),
                  _buildLocationOption('assets/odisha.jpg', 'Odisha'),
                  _buildLocationOption('assets/aust.jpg', 'Australia'),
                  _buildLocationOption('assets/eur.jpeg', 'Europe'),
                  _buildLocationOption('assets/goa.jpg', 'Goa'),
                  _buildLocationOption('assets/rajasthan.jpg', 'Rajasthan'),
                  _buildLocationOption('assets/KARNATAKA.jpg', 'Karnataka'),
                  _buildLocationOption('assets/KERALA.jpeg', 'Kerala'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildChatbotButton(), // Chatbot button
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _isChatbotVisible ? _buildChatbotInterface() : null, // Show chatbot interface when visible
    );
  }

  // Helper function to create booking options
  Widget _buildBookingOption({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Helper function to create location options
  Widget _buildLocationOption(String imagePath, String locationName) {
    return GestureDetector(
      onTap: () {
        // Navigate to location details page
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              locationName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Chatbot button widget
  Widget _buildChatbotButton() {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.white, // Splash color
          child: SizedBox(
            width: 56,
            height: 56,
            child: Center(
              child: Image.asset('assets/chatbot.jpg', width: 30, height: 30), // Custom circular chatbot image
            ),
          ),
          onTap: () {
            setState(() {
              _isChatbotVisible = !_isChatbotVisible; // Toggle chatbot visibility
            });
          },
        ),
      ),
    );
  }

  // Chatbot interface widget
  Widget _buildChatbotInterface() {
    return Container(
      height: 300,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Chatbot',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              // This is where you can add your chatbot message area
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 1)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onSubmitted: (message) {
                // Handle message submission
              },
            ),
          ),
        ],
      ),
    );
  }
}
