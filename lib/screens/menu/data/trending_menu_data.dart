import 'package:dashboard/utils/constants.dart';

class TrendingMenuData {
  final String name;
  final String price;
  final double rating;
  final String image;

  TrendingMenuData({
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
  });
}

class TrendingMenuDataList {
  static List<TrendingMenuData> items = <TrendingMenuData>[
    TrendingMenuData(
      name: 'Crispy Calamari Rings',
      price: '\$6.50',
      rating: 4.5,
      image: Constants.calamariImg,
    ),
    TrendingMenuData(
      name: 'Classic Pancakes',
      price: '\$4.99',
      rating: 4.3,
      image: Constants.classicPancakesImg,
    ),
    TrendingMenuData(
      name: 'Breakfast Burrito',
      price: '\$6.99',
      rating: 4.2,
      image: Constants.breakfastBurritoImg,
    ),
    TrendingMenuData(
      name: 'Beef Burger',
      price: '\$11.99',
      rating: 4.8,
      image: Constants.beefBurgerImg,
    ),
    TrendingMenuData(
      name: 'Spaghetti Carbonara',
      price: '\$10.99',
      rating: 4.7,
      image: Constants.spaghettiCarbonaraImg,
    ),
    TrendingMenuData(
      name: 'Chicken Sandwich',
      price: '\$9.99',
      rating: 4.6,
      image: Constants.grilledChickenSandwichImg,
    ),
  ];
}
