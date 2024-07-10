import 'package:booknewtable/components/my_current_location.dart';
import 'package:booknewtable/components/my_sliver_app_bar.dart';
import 'package:booknewtable/pages/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:booknewtable/models/restaurants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const MySliverAppBar(
            title: Text("Pick a Restaurant"),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromARGB(255, 245, 245, 245),
              ),
              MyCurrentLocation()
            ]),
          )
        ],
        body: ListView.builder(
          itemCount: restaurantList.length,
          itemBuilder: (context, index) {
            var restaurant = restaurantList[index];
            return Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    restaurant.imagePath,
                    width: 60,
                    height: 70,
                    fit: BoxFit.cover,
                    
                  ),
                  title: Text(restaurant.name),
                  subtitle: Text(restaurant.location),
                  trailing: Text('${restaurant.rating} ⭐'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RestaurantPage(restaurant: restaurant))),
                ),
                if (index <
                    restaurantList.length -
                        1) // Add a divider if it's not the last item
                  const Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Color.fromARGB(255, 210, 210, 210),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
