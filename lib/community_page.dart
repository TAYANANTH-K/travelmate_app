import 'package:flutter/material.dart';

class Post {
  final String name;
  final String content;
  final String profileImagePath;
  final String postImagePath;

  Post({
    required this.name,
    required this.content,
    required this.profileImagePath,
    required this.postImagePath,
  });
}

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<Post> _posts = [
    Post(
      name: 'User1',
      content: 'Post about Coimbatore trip',
      profileImagePath: 'assets/user1.jpg',
      postImagePath: 'assets/shiv.jpg',
    ),
    Post(
      name: 'User2',
      content: 'Best places to visit in Tamil Nadu',
      profileImagePath: 'assets/user2.jpg',
      postImagePath: 'assets/tanj.jpg',
    ),
    Post(
      name: 'User3',
      content: 'Food experiences in Coimbatore',
      profileImagePath: 'assets/user3.jpg',
      postImagePath: 'assets/sss.jpg',
    ),
    Post(
      name: 'User4',
      content: 'Exploring the temples of Tamil Nadu',
      profileImagePath: 'assets/user4.jpg',
      postImagePath: 'assets/tamilnadu.jpg',
    ),
  ];

  List<Post> _filteredPosts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredPosts = _posts;
  }

  void _filterPosts() {
    setState(() {
      if (_searchQuery.isEmpty) {
        _filteredPosts = _posts;
      } else {
        _filteredPosts = _posts.where((post) =>
        post.content.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            post.name.toLowerCase().contains(_searchQuery.toLowerCase())
        ).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              onChanged: (value) {
                _searchQuery = value;
                _filterPosts();
              },
              decoration: InputDecoration(
                hintText: 'Search posts...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Displaying Posts
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPosts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile Image and Name
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(_filteredPosts[index].profileImagePath),
                                radius: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                _filteredPosts[index].name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          // Post Content
                          Text(
                            _filteredPosts[index].content,
                            style: TextStyle(fontSize: 16),
                          ),

                          SizedBox(height: 10),

                          // Post Image
                          Image.asset(
                            _filteredPosts[index].postImagePath,
                            fit: BoxFit.cover,
                          ),
                        ],
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
