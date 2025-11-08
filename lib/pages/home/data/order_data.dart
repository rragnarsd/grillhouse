import 'package:flutter/material.dart';

enum Status { pending, delivered, cancelled, processing }

final List<Order> orders = <Order>[
  Order(
    id: 1,
    productName: 'Product 1',
    customerName: 'Customer 1',
    status: Status.pending,
    deliveryTime: '11:05 AM',
    price: 10,
  ),
  Order(
    id: 2,
    productName: 'Product 2',
    customerName: 'Customer 2',
    status: Status.delivered,
    deliveryTime: '11:05 AM',
    price: 15,
  ),
  Order(
    id: 3,
    productName: 'Product 3',
    customerName: 'Customer 3',
    status: Status.processing,
    deliveryTime: '11:05 AM',
    price: 25,
  ),
  Order(
    id: 4,
    productName: 'Product 4',
    customerName: 'Customer 4',
    status: Status.pending,
    deliveryTime: '11:05 AM',
    price: 30,
  ),
  Order(
    id: 5,
    productName: 'Product 5',
    customerName: 'Customer 5',
    status: Status.delivered,
    deliveryTime: '11:05 AM',
    price: 17,
  ),
  Order(
    id: 6,
    productName: 'Product 6',
    customerName: 'Customer 6',
    status: Status.cancelled,
    deliveryTime: '11:05 AM',
    price: 18,
  ),
  Order(
    id: 7,
    productName: 'Product 7',
    customerName: 'Customer 7',
    status: Status.pending,
    deliveryTime: '11:05 AM',
    price: 19,
  ),
  Order(
    id: 8,
    productName: 'Product 8',
    customerName: 'Customer 8',
    status: Status.delivered,
    deliveryTime: '11:05 AM',
    price: 16,
  ),
];

class Order {
  final int id;
  final String productName;
  final String customerName;
  final Status status;
  final String deliveryTime;
  final double price;

  Order({
    required this.id,
    required this.productName,
    required this.customerName,
    required this.status,
    required this.deliveryTime,
    required this.price,
  });

  String get statusLabel => switch (status) {
    Status.pending => 'Pending',
    Status.delivered => 'Delivered',
    Status.cancelled => 'Cancelled',
    Status.processing => 'Processing',
  };

  Color get statusColor => switch (status) {
    Status.pending => Colors.orange,
    Status.delivered => Colors.green,
    Status.cancelled => Colors.red,
    Status.processing => Colors.blue,
  };
}
