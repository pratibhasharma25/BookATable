import 'package:booknewtable/models/restaurants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveBookingDetailsToFirestore(
    Restaurants restaurant, DateTime bookingDateTime) async {
  final firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection('bookings').add({
      'restaurant_name': restaurant.name,
      'booking_date': bookingDateTime,
      'restaurant_location': restaurant.location,
    });
    print('Booking details saved to Firestore.');
  } catch (e) {
    print('Error saving booking details: $e');
  }
}
