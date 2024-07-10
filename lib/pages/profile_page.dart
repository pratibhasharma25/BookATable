import 'package:booknewtable/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<Widget>> _fetchBookingDetails() async {
    List<Widget> listTiles = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('bookings').get();
      List<QueryDocumentSnapshot> bookings = querySnapshot.docs;

      for (int i = 0; i < bookings.length; i++) {
        var booking = bookings[i];
        listTiles.add(
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text((i + 1).toString()), // Display index as avatar
                ),
                title: Text('Booking ${i + 1}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBookingDetailRow(
                      context,
                      "Booking Under Name:",
                      "${booking['booking_name']}",
                    ),
                    _buildBookingDetailRow(
                      context,
                      "Restaurant Name:",
                      "${booking['restaurant_name']}",
                    ),
                    _buildBookingDetailRow(
                      context,
                      "Restaurant Location:",
                      "${booking['restaurant_location']}",
                    ),
                    _buildBookingDetailRow(
                      context,
                      "On:",
                      "${booking['booking_date_time'].toDate()}",
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ), // Add a divider after each ListTile
            ],
          ),
        );
      }
    } catch (e) {
      print('Error fetching booking details: $e');
    }
    return listTiles;
  }

  Widget _buildBookingDetailRow(
      BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const LoginOrRegister()), // Navigate to login page after sign out
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => signOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder<List<Widget>>(
        future: _fetchBookingDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No bookings found.'));
          } else {
            return ListView(
              children: snapshot.data!,
            );
          }
        },
      ),
    );
  }
}
