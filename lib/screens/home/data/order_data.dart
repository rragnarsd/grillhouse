import 'package:flutter/material.dart';
import 'package:grill_house/utils/constants.dart';

enum Status { pending, delivered, cancelled, processing }

class Order {
  final String orderId;
  final String customerName;
  final String customerImg;
  final Status status;
  final DateTime date;
  final List<OrderItem> items;

  Order({
    required this.orderId,
    required this.customerName,
    required this.customerImg,
    required this.status,
    required this.date,
    required this.items,
  });
  double get totalPrice =>
      items.fold(0.0, (double sum, OrderItem item) => sum + item.productPrice);

  String get statusLabel => switch (status) {
    Status.pending => Constants.pending,
    Status.delivered => Constants.delivered,
    Status.cancelled => Constants.cancelled,
    Status.processing => Constants.processing,
  };

  Color get statusColor => switch (status) {
    Status.pending => Colors.orange.withValues(alpha: 0.2),
    Status.delivered => Colors.green.withValues(alpha: 0.2),
    Status.cancelled => Colors.red.withValues(alpha: 0.2),
    Status.processing => Colors.blue.withValues(alpha: 0.2),
  };
}

Order createOrder({
  required String orderId,
  required String customerName,
  required String customerImg,
  required Status status,
  required DateTime date,
  required List<Map<String, dynamic>> products,
}) {
  final List<OrderItem> items = products
      .map(
        (Map<String, dynamic> product) => OrderItem(
          productId: product['id'],
          productName: product['name'],
          productPrice: product['price'],
          productImage: product['image'],
        ),
      )
      .toList();

  return Order(
    orderId: orderId,
    customerName: customerName,
    customerImg: customerImg,
    status: status,
    date: date,
    items: items,
  );
}

final List<Order> orders = <Order>[
  createOrder(
    orderId: 'Order-001',
    customerName: 'Sarah Johnson',
    customerImg: Constants.customerImg1,
    status: Status.pending,
    date: DateTime(2025, 11, 15, 14, 30),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-001',
        'name': Constants.calamariName,
        'price': Constants.calamariPrice,
        'image': Constants.calamariImg,
      },
      <String, dynamic>{
        'id': 'PROD-002',
        'name': Constants.garlicBreadName,
        'price': Constants.garlicBreadPrice,
        'image': Constants.garlicBreadImg,
      },
      <String, dynamic>{
        'id': 'PROD-015',
        'name': Constants.strawberryCheesecakeName,
        'price': Constants.strawberryCheesecakePrice,
        'image': Constants.strawberryCheesecakeImg,
      },
    ],
  ),
  createOrder(
    orderId: 'Order-002',
    customerName: 'Michael Chen',
    customerImg: Constants.customerImg2,
    status: Status.delivered,
    date: DateTime(2025, 11, 10, 9, 15),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-003',
        'name': Constants.mozzarellaCheeseSticksName,
        'price': Constants.mozzarellaCheeseSticksPrice,
        'image': Constants.mozzarellaCheeseSticksImg,
      },
      <String, dynamic>{
        'id': 'PROD-010',
        'name': Constants.spicyShrimpRiceName,
        'price': Constants.spicyShrimpRicePrice,
        'image': Constants.spicyShrimpRiceImg,
      },
    ],
  ),
  createOrder(
    orderId: 'Order-003',
    customerName: 'Emily Rodriguez',
    customerImg: Constants.customerImg3,
    status: Status.processing,
    date: DateTime(2025, 11, 18, 16, 45),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-004',
        'name': Constants.classicPancakesName,
        'price': Constants.classicPancakesPrice,
        'image': Constants.classicPancakesImg,
      },
      <String, dynamic>{
        'id': 'PROD-015',
        'name': Constants.strawberryCheesecakeName,
        'price': Constants.strawberryCheesecakePrice,
        'image': Constants.strawberryCheesecakeImg,
      },
      <String, dynamic>{
        'id': 'PROD-009',
        'name': Constants.grilledChickenSandwichName,
        'price': Constants.grilledChickenSandwichPrice,
        'image': Constants.grilledChickenSandwichImg,
      },
    ],
  ),
  createOrder(
    orderId: 'Order-004',
    customerName: 'David Thompson',
    customerImg: Constants.customerImg4,
    status: Status.pending,
    date: DateTime(2025, 11, 20, 11, 20),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-007',
        'name': Constants.beefBurgerName,
        'price': Constants.beefBurgerPrice,
        'image': Constants.beefBurgerImg,
      },
      <String, dynamic>{
        'id': 'PROD-005',
        'name': Constants.avocadoToastName,
        'price': Constants.avocadoToastPrice,
        'image': Constants.avocadoToastImg,
      },
    ],
  ),
  createOrder(
    orderId: 'Order-005',
    customerName: 'Jessica Williams',
    customerImg: Constants.customerImg5,
    status: Status.delivered,
    date: DateTime(2025, 11, 8, 13, 10),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-009',
        'name': Constants.grilledChickenSandwichName,
        'price': Constants.grilledChickenSandwichPrice,
        'image': Constants.grilledChickenSandwichImg,
      },
      <String, dynamic>{
        'id': 'PROD-008',
        'name': Constants.spaghettiCarbonaraName,
        'price': Constants.spaghettiCarbonaraPrice,
        'image': Constants.spaghettiCarbonaraImg,
      },
      <String, dynamic>{
        'id': 'PROD-007',
        'name': Constants.beefBurgerName,
        'price': Constants.beefBurgerPrice,
        'image': Constants.beefBurgerImg,
      },
    ],
  ),
  createOrder(
    orderId: 'Order-006',
    customerName: 'Robert Martinez',
    customerImg: Constants.customerImg7,
    status: Status.cancelled,
    date: DateTime(2025, 11, 12, 10, 5),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-002',
        'name': Constants.garlicBreadName,
        'price': Constants.garlicBreadPrice,
        'image': Constants.garlicBreadImg,
      },
      <String, dynamic>{
        'id': 'PROD-007',
        'name': Constants.beefBurgerName,
        'price': Constants.beefBurgerPrice,
        'image': Constants.beefBurgerImg,
      },
      <String, dynamic>{
        'id': 'PROD-008',
        'name': Constants.spaghettiCarbonaraName,
        'price': Constants.spaghettiCarbonaraPrice,
        'image': Constants.spaghettiCarbonaraImg,
      },
    ],
  ),
  createOrder(
    orderId: 'Order-007',
    customerName: 'Amanda Davis',
    customerImg: Constants.customerImg8,
    status: Status.pending,
    date: DateTime(2025, 11, 22, 15, 30),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-013',
        'name': Constants.chocolateLavaCakeName,
        'price': Constants.chocolateLavaCakePrice,
        'image': Constants.chocolateLavaCakeImg,
      },
      <String, dynamic>{
        'id': 'PROD-006',
        'name': Constants.breakfastBurritoName,
        'price': Constants.breakfastBurritoPrice,
        'image': Constants.breakfastBurritoImg,
      },
    ],
  ),
  createOrder(
    orderId: 'Order-008',
    customerName: 'James Wilson',
    customerImg: Constants.customerImg9,
    status: Status.delivered,
    date: DateTime(2025, 11, 5, 8, 45),
    products: <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 'PROD-016',
        'name': Constants.icedLatteName,
        'price': Constants.icedLattePrice,
        'image': Constants.icedLatteImg,
      },
      <String, dynamic>{
        'id': 'PROD-017',
        'name': Constants.mintMojitoName,
        'price': Constants.mintMojitoPrice,
        'image': Constants.mintMojitoImg,
      },
    ],
  ),
];

class OrderItem {
  final String productId;
  final String productName;
  final double productPrice;
  final String productImage;
  OrderItem({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });
}
