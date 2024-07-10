import 'package:flutter/material.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  String currentLocation = "Enter your location";
  final TextEditingController locationController = TextEditingController();
  

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Your Location"),
          content: TextField(
            controller: locationController,
            decoration: const InputDecoration(hintText: "Search Address..."),
          ),
          actions: [
            // Cancel button
            MaterialButton(
              onPressed: () {
                locationController.clear(); // Clear the controller
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            // Save button
            MaterialButton(
              onPressed: () {
                setState(() {
                  currentLocation = locationController.text;
                });
                locationController.clear(); // Clear the controller
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Location",
            style: TextStyle(color: Color.fromARGB(224, 85, 85, 85)),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Text(
                  currentLocation,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 112, 112, 112),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
