import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

enum Status { pending, delivered, cancelled, processing }

class Order {
  final String productId;
  final String productName;
  final String customerName;
  final Status status;
  final DateTime date;
  final double price;

  Order({
    required this.productId,
    required this.productName,
    required this.customerName,
    required this.status,
    required this.date,
    required this.price,
  });

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

final List<Order> orders = <Order>[
  Order(
    productId: 'PROD-001',
    productName: 'Margherita Pizza',
    customerName: 'Sarah Johnson',
    status: Status.pending,
    date: DateTime(2025, 11, 15, 14, 30),
    price: 10,
  ),
  Order(
    productId: 'PROD-002',
    productName: 'Caesar Salad',
    customerName: 'Michael Chen',
    status: Status.delivered,
    date: DateTime(2025, 11, 10, 9, 15),
    price: 15,
  ),
  Order(
    productId: 'PROD-003',
    productName: 'Grilled Salmon',
    customerName: 'Emily Rodriguez',
    status: Status.processing,
    date: DateTime(2025, 11, 18, 16, 45),
    price: 25,
  ),
  Order(
    productId: 'PROD-004',
    productName: 'Beef Burger',
    customerName: 'David Thompson',
    status: Status.pending,
    date: DateTime(2025, 11, 20, 11, 20),
    price: 30,
  ),
  Order(
    productId: 'PROD-005',
    productName: 'Chicken Pasta',
    customerName: 'Jessica Williams',
    status: Status.delivered,
    date: DateTime(2025, 11, 8, 13, 10),
    price: 17,
  ),
  Order(
    productId: 'PROD-006',
    productName: 'Garlic Bread',
    customerName: 'Robert Martinez',
    status: Status.cancelled,
    date: DateTime(2025, 11, 12, 10, 5),
    price: 18,
  ),
  Order(
    productId: 'PROD-007',
    productName: 'Chocolate Cake',
    customerName: 'Amanda Davis',
    status: Status.pending,
    date: DateTime(2025, 11, 22, 15, 30),
    price: 19,
  ),
  Order(
    productId: 'PROD-008',
    productName: 'Fish & Chips',
    customerName: 'James Wilson',
    status: Status.delivered,
    date: DateTime(2025, 11, 5, 8, 45),
    price: 16,
  ),
];
