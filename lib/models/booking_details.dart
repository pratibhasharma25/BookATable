import 'package:cloud_firestore/cloud_firestore.dart';

class BookingDetail {
  final String restaurantName;
  final DateTime bookingDateTime;
  final String restaurantLocation;
  final String bookingName;

  BookingDetail({
    required this.restaurantName,
    required this.bookingDateTime,
    required this.restaurantLocation,
    required this.bookingName,
  });

  factory BookingDetail.fromFirestore(Map<String, dynamic> data) {
    return BookingDetail(
      restaurantName: data['restaurant_name'],
      bookingDateTime: (data['booking_date_time'] as Timestamp).toDate(),
      restaurantLocation: data['restaurant_location'],
      bookingName: data['booking_name'],
    );
  }
}
