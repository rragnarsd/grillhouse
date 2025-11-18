import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/enums.dart';

enum Category { appetizers, breakfast, lunch, dinner, dessert, drinks }

extension CategoryName on Category {
  String get displayName => switch (this) {
    Category.appetizers => Constants.appetizers,
    Category.breakfast => Constants.breakfast,
    Category.lunch => Constants.lunch,
    Category.dinner => Constants.dinner,
    Category.dessert => Constants.dessert,
    Category.drinks => Constants.drinks,
  };
}

class MenuItem {
  final String name;
  final double price;
  final String description;
  final Category category;
  final String image;
  final ServingUnit servingUnit;

  const MenuItem({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.servingUnit,
  });
}

class MenuData {
  static const List<MenuItem> items = <MenuItem>[
    MenuItem(
      name: Constants.calamariName,
      price: Constants.calamariPrice,
      description: Constants.calamariDesc,
      category: Category.appetizers,
      image: Constants.calamariImg,
      servingUnit: ServingUnit.plate,
    ),
    MenuItem(
      name: Constants.garlicBreadName,
      price: Constants.garlicBreadPrice,
      description: Constants.garlicBreadDesc,
      category: Category.appetizers,
      image: Constants.garlicBreadImg,
      servingUnit: ServingUnit.serving,
    ),
    MenuItem(
      name: Constants.mozzarellaCheeseSticksName,
      price: Constants.mozzarellaCheeseSticksPrice,
      description: Constants.mozzarellaCheeseSticksDesc,
      category: Category.appetizers,
      image: Constants.mozzarellaCheeseSticksImg,
      servingUnit: ServingUnit.basket,
    ),

    MenuItem(
      name: Constants.classicPancakesName,
      price: Constants.classicPancakesPrice,
      description: Constants.classicPancakesDesc,
      category: Category.breakfast,
      image: Constants.classicPancakesImg,
      servingUnit: ServingUnit.stack,
    ),

    MenuItem(
      name: Constants.avocadoToastName,
      price: Constants.avocadoToastPrice,
      description: Constants.avocadoToastDesc,
      category: Category.breakfast,
      image: Constants.avocadoToastImg,
      servingUnit: ServingUnit.serving,
    ),

    MenuItem(
      name: Constants.breakfastBurritoName,
      price: Constants.breakfastBurritoPrice,
      description: Constants.breakfastBurritoDesc,
      category: Category.breakfast,
      image: Constants.breakfastBurritoImg,
      servingUnit: ServingUnit.serving,
    ),

    MenuItem(
      name: Constants.beefBurgerName,
      price: Constants.beefBurgerPrice,
      description: Constants.beefBurgerDesc,
      category: Category.lunch,
      image: Constants.beefBurgerImg,
      servingUnit: ServingUnit.serving,
    ),
    MenuItem(
      name: Constants.spaghettiCarbonaraName,
      price: Constants.spaghettiCarbonaraPrice,
      description: Constants.spaghettiCarbonaraDesc,
      category: Category.lunch,
      image: Constants.spaghettiCarbonaraImg,
      servingUnit: ServingUnit.plate,
    ),
    MenuItem(
      name: Constants.grilledChickenSandwichName,
      price: Constants.grilledChickenSandwichPrice,
      description: Constants.grilledChickenSandwichDesc,
      category: Category.lunch,
      image: Constants.grilledChickenSandwichImg,
      servingUnit: ServingUnit.serving,
    ),

    MenuItem(
      name: Constants.spicyShrimpRiceName,
      price: Constants.spicyShrimpRicePrice,
      description: Constants.spicyShrimpRiceDesc,
      category: Category.dinner,
      image: Constants.spicyShrimpRiceImg,
      servingUnit: ServingUnit.serving,
    ),
    MenuItem(
      name: Constants.beefSteakName,
      price: Constants.beefSteakPrice,
      description: Constants.beefSteakDesc,
      category: Category.dinner,
      image: Constants.beefSteakImg,
      servingUnit: ServingUnit.serving,
    ),
    MenuItem(
      name: Constants.garlicChickenName,
      price: Constants.garlicChickenPrice,
      description: Constants.garlicChickenDesc,
      category: Category.dinner,
      image: Constants.garlicChickenImg,
      servingUnit: ServingUnit.serving,
    ),

    MenuItem(
      name: Constants.chocolateLavaCakeName,
      price: Constants.chocolateLavaCakePrice,
      description: Constants.chocolateLavaCakeDesc,
      category: Category.dessert,
      image: Constants.chocolateLavaCakeImg,
      servingUnit: ServingUnit.slice,
    ),
    MenuItem(
      name: Constants.vanillaIceCreamName,
      price: Constants.vanillaIceCreamPrice,
      description: Constants.vanillaIceCreamDesc,
      category: Category.dessert,
      image: Constants.vanillaIceCreamImg,
      servingUnit: ServingUnit.cup,
    ),
    MenuItem(
      name: Constants.strawberryCheesecakeName,
      price: Constants.strawberryCheesecakePrice,
      description: Constants.strawberryCheesecakeDesc,
      category: Category.dessert,
      image: Constants.strawberryCheesecakeImg,
      servingUnit: ServingUnit.slice,
    ),

    MenuItem(
      name: Constants.icedLatteName,
      price: Constants.icedLattePrice,
      description: Constants.icedLatteDesc,
      category: Category.drinks,
      image: Constants.icedLatteImg,
      servingUnit: ServingUnit.cup,
    ),
    MenuItem(
      name: Constants.mintMojitoName,
      price: Constants.mintMojitoPrice,
      description: Constants.mintMojitoDesc,
      category: Category.drinks,
      image: Constants.mintMojitoImg,
      servingUnit: ServingUnit.glass,
    ),
    MenuItem(
      name: Constants.freshLemonadeName,
      price: Constants.freshLemonadePrice,
      description: Constants.freshLemonadeDesc,
      category: Category.drinks,
      image: Constants.freshLemonadeImg,
      servingUnit: ServingUnit.glass,
    ),
  ];
}
