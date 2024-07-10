import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:booknewtable/models/booking_details.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BookingDetail>> fetchBookingDetails() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('bookings').get();
      if (querySnapshot.docs.isEmpty) {
        print('No bookings found in Firestore.');
      } else {
        print('Bookings found in Firestore: ${querySnapshot.docs.length}');
      }
      return querySnapshot.docs
          .map((doc) =>
              BookingDetail.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching booking details: $e');
      return [];
    }
  }
}
