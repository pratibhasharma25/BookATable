

class Restaurants {
  final String name;
  final String location;
  final String imagePath;
  final double rating;

  Restaurants({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.rating,
  });
}

final List<Restaurants> restaurantList = [
  Restaurants(
    name: 'United Coffee House',
    location: 'Connaught Place, New Delhi',
    imagePath: 'lib/images/res1.jpg',
    rating: 4.5,
  ),
  Restaurants(
    name: 'Gulati',
    location: 'Pandara Market, New Delhi',
    imagePath: 'lib/images/res2.jpg',
    rating: 4.0,
  ),
  Restaurants(
    name: 'Zoca Courtyard',
    location: 'Hajipur, Noida',
    imagePath: 'lib/images/res3.jpg',
    rating: 3.5,
  ),
  Restaurants(
    name: 'Big Pitcher',
    location: 'Sector 29, Gurgaon',
    imagePath: 'lib/images/res4.jpg',
    rating: 4.5,
  ),
  Restaurants(
    name: 'Indian Accent',
    location: 'The Lodhi, Lodhi Road, New Delhi',
    imagePath: 'lib/images/res5.jpg',
    rating: 4.0,
  ),
  Restaurants(
    name: 'Dhaba - Estd 1986 Delhi',
    location: 'DLF Avenue, Saket, New Delhi',
    imagePath: 'lib/images/res6.jpg',
    rating: 3.5,
  ),
  Restaurants(
    name: 'Downtown Fresh Beer Cafe- Galleria Market',
    location: 'DLF Galleria, DLF Phase 4, Gurgaon',
    imagePath: 'lib/images/res7.jpg',
    rating: 4.5,
  ),
  Restaurants(
    name: 'Daryaganj - By The Inventors Of Butter Chicken And Dal Makhani',
    location: 'DLF Mall of India, Sector 18, Noida',
    imagePath: 'lib/images/res8.jpg',
    rating: 4.0,
  ),
  Restaurants(
    name: 'Cafe Belong',
    location: 'Golf Course Extension, Gurgaon',
    imagePath: 'lib/images/res9.jpg',
    rating: 3.5,
  ),
  Restaurants(
    name: 'Uncultured Cafe And Bar',
    location: 'Kailash Colony Market, New Delhi',
    imagePath: 'lib/images/res10.jpg',
    rating: 4.5,
  ),
  Restaurants(
    name: 'Yeti - The Himalayan Kitchen',
    location: 'The Colonnade, Connaught Place, New Delhi',
    imagePath: 'lib/images/res11.jpg',
    rating: 4.0,
  ),
  Restaurants(
    name: 'ILLUZION Luxe Club',
    location: 'Gardens Galleria Mall, Sector 38, Noida',
    imagePath: 'lib/images/res12.jpg',
    rating: 3.5,
  ),
  // Add more restaurants here
];


