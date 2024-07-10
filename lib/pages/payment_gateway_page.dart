import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:booknewtable/components/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:booknewtable/models/restaurants.dart';

class PaymentGatewayPage extends StatefulWidget {
  final Restaurants restaurant;
  final DateTime bookingDate;
  final TimeOfDay bookingTime;
  final String bookingName;

  const PaymentGatewayPage({
    super.key,
    required this.restaurant,
    required this.bookingDate,
    required this.bookingTime,
    required this.bookingName,
  });

  @override
  State<PaymentGatewayPage> createState() => _PaymentGatewayPageState();
}

class _PaymentGatewayPageState extends State<PaymentGatewayPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  Future<void> _saveBookingDetailsToFirestore() async {
    final bookingDateTime = DateTime(
      widget.bookingDate.year,
      widget.bookingDate.month,
      widget.bookingDate.day,
      widget.bookingTime.hour,
      widget.bookingTime.minute,
    );

    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        'restaurant_name': widget.restaurant.name,
        'restaurant_location': widget.restaurant.location,
        'booking_date_time': bookingDateTime,
        'booking_name': widget.bookingName,
      });
      print('Booking details saved to Firestore.');
    } catch (e) {
      print('Error saving booking details: $e');
    }
  }

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close confirmation dialog
                await _saveBookingDetailsToFirestore(); // Save booking details
                _showBookingConfirmation(); // Show booking confirmation message
              },
              child: const Text("Yes"),
            )
          ],
        ),
      );
    }
  }

  void _showBookingConfirmation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'Table booked successfully!',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 6),
      ),
    );
    Navigator.pop(context); // Navigate back to the previous page after booking
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Gateway')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey,
            ),
            const SizedBox(height: 20), // Spacer
            MyButton(text: "Pay Now", onTap: userTappedPay),
          ],
        ),
      ),
    );
  }
}
