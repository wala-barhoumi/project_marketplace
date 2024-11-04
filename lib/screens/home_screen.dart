// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'profile_screen.dart'; // Import ProfileScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the selected index

  // List of screens to show based on the selected index
  final List<Widget> _screens = [
    HomeContentScreen(), // Main home content
    SearchScreen(),      // Search screen
    Center(child: Text("Favorites")), // Placeholder for Favorites screen
    Center(child: Text("Cart")),       // Placeholder for Cart screen
    ProfileScreen(),     // Link ProfileScreen here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Show screen based on selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// Extracted Home Content as a separate StatelessWidget
class HomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove the back arrow
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.blue),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                'Delivery: 9514, Pualena St 71, Kaneohe, HI',
                style: TextStyle(color: Colors.black, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHighlightProduct(),
            SizedBox(height: 20),
            _buildPopularCategories(),
            SizedBox(height: 20),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightProduct() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            'lib/assets/rose_hibiscus_mist.png',
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rose Hibiscus Mist',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$36.00',
                style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough),
              ),
              Text(
                '\$34.20',
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularCategories() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                // Handle 'See all' navigation
              },
              child: Text(
                'See all',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCategoryIcon(Icons.face, 'Beauty'),
            _buildCategoryIcon(Icons.checkroom, 'Clothes'),
            _buildCategoryIcon(Icons.book, 'Books'),
            _buildCategoryIcon(Icons.home, 'Home'),
            _buildCategoryIcon(Icons.sports_soccer, 'Sport'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryIcon(IconData iconData, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(iconData, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildProductGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildProductCard('Moisturising tonic', 'lib/assets/tonic.jpg', '\$27.90'),
        _buildProductCard('Facial moisturiser', 'lib/assets/moisturiser.jpg', '\$45.50'),
      ],
    );
  }

  Widget _buildProductCard(String name, String imagePath, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
