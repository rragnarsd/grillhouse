import 'package:grill_house/utils/constants.dart';

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
      name: Constants.calamariName,
      price: '\$6.50',
      rating: 4.5,
      image: Constants.calamariImg,
    ),
    TrendingMenuData(
      name: Constants.classicPancakesName,
      price: '\$4.99',
      rating: 4.3,
      image: Constants.classicPancakesImg,
    ),
    TrendingMenuData(
      name: Constants.breakfastBurritoName,
      price: '\$6.99',
      rating: 4.2,
      image: Constants.breakfastBurritoImg,
    ),
    TrendingMenuData(
      name: Constants.beefBurgerName,
      price: '\$11.99',
      rating: 4.8,
      image: Constants.beefBurgerImg,
    ),
    TrendingMenuData(
      name: Constants.spaghettiCarbonaraName,
      price: '\$10.99',
      rating: 4.7,
      image: Constants.spaghettiCarbonaraImg,
    ),
    TrendingMenuData(
      name: Constants.grilledChickenSandwichName,
      price: '\$9.99',
      rating: 4.6,
      image: Constants.grilledChickenSandwichImg,
    ),
  ];
}
