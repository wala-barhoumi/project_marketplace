import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with actual image URL or asset path
              ),
            ),
            SizedBox(height: 20),
            // Full Name
            ListTile(
              title: Text(
                'Full name',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: Text(
                'Jane Kolinz',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Divider(),
            // Email
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: Text(
                'janekolinz@gmail.com',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Divider(),
            // Additional info like Phone Number, etc.
            ListTile(
              title: Text(
                'Phone Number',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: Text(
                '+1 234 567 890',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
