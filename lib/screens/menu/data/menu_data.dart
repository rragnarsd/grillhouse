import 'package:dashboard/utils/constants.dart';

enum Category { appetizers, breakfast, lunch, dinner, dessert, drinks }

extension CategoryName on Category {
  String get displayName {
    switch (this) {
      case Category.appetizers:
        return 'Appetizers';
      case Category.breakfast:
        return 'Breakfast';
      case Category.lunch:
        return 'Lunch';
      case Category.dinner:
        return 'Dinner';
      case Category.dessert:
        return 'Dessert';
      case Category.drinks:
        return 'Drinks';
    }
  }
}

class MenuItem {
  final String name;
  final String price;
  final Category category;
  final String image;

  const MenuItem({
    required this.name,
    required this.price,
    required this.category,
    required this.image,
  });
}

class MenuData {
  static const List<MenuItem> items = <MenuItem>[
    MenuItem(
      name: 'Crispy Calamari Rings',
      price: '\$6.50 / plate',
      category: Category.appetizers,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Garlic Bread with Cheese',
      price: '\$5.99 / serving',
      category: Category.appetizers,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Garlic Bread with Cheese',
      price: '\$5.99 / serving',
      category: Category.appetizers,
      image: Constants.bestSellerImg,
    ),

    MenuItem(
      name: 'Classic Pancakes',
      price: '\$4.99 / stack',
      category: Category.breakfast,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Avocado Toast',
      price: '\$6.25 / serving',
      category: Category.breakfast,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Avocado Toast',
      price: '\$6.25 / serving',
      category: Category.breakfast,
      image: Constants.bestSellerImg,
    ),

    MenuItem(
      name: 'Beef Burger with Fries',
      price: '\$11.99 / combo',
      category: Category.lunch,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Spaghetti Carbonara',
      price: '\$10.99 / plate',
      category: Category.lunch,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Spaghetti Carbonara',
      price: '\$10.99 / plate',
      category: Category.lunch,
      image: Constants.bestSellerImg,
    ),

    MenuItem(
      name: 'Spicy Shrimp Rice',
      price: '\$8.99 / serving',
      category: Category.dinner,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Garlic Fried Butter Shrimp',
      price: '\$8.99 / serving',
      category: Category.dinner,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Garlic Fried Butter Shrimp',
      price: '\$8.99 / serving',
      category: Category.dinner,
      image: Constants.bestSellerImg,
    ),

    MenuItem(
      name: 'Chocolate Lava Cake',
      price: '\$5.99 / slice',
      category: Category.dessert,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Vanilla Ice Cream Sundae',
      price: '\$4.75 / cup',
      category: Category.dessert,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Vanilla Ice Cream Sundae',
      price: '\$4.75 / cup',
      category: Category.dessert,
      image: Constants.bestSellerImg,
    ),

    MenuItem(
      name: 'Iced Latte',
      price: '\$4.50 / cup',
      category: Category.drinks,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Classic Mojito',
      price: '\$5.99 / glass',
      category: Category.drinks,
      image: Constants.bestSellerImg,
    ),
    MenuItem(
      name: 'Classic Mojito',
      price: '\$5.99 / glass',
      category: Category.drinks,
      image: Constants.bestSellerImg,
    ),
  ];
}
