import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

enum Status { pending, delivered, cancelled, processing }

class Order {
  final String productId;
  final String productName;
  final String customerName;
  final Status status;
  final String date;
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
    Status.pending => Colors.orange,
    Status.delivered => Colors.green,
    Status.cancelled => Colors.red,
    Status.processing => Colors.blue,
  };
}

final List<Order> orders = <Order>[
  Order(
    productId: '1',
    productName: 'Product 1',
    customerName: 'Customer 1',
    status: Status.pending,
    date: '11:05 AM',
    price: 10,
  ),
  Order(
    productId: '2',
    productName: 'Product 2',
    customerName: 'Customer 2',
    status: Status.delivered,
    date: '11:05 AM',
    price: 15,
  ),
  Order(
    productId: '3',
    productName: 'Product 3',
    customerName: 'Customer 3',
    status: Status.processing,
    date: '11:05 AM',
    price: 25,
  ),
  Order(
    productId: '4',
    productName: 'Product 4',
    customerName: 'Customer 4',
    status: Status.pending,
    date: '11:05 AM',
    price: 30,
  ),
  Order(
    productId: '5',
    productName: 'Product 5',
    customerName: 'Customer 5',
    status: Status.delivered,
    date: '11:05 AM',
    price: 17,
  ),
  Order(
    productId: '6',
    productName: 'Product 6',
    customerName: 'Customer 6',
    status: Status.cancelled,
    date: '11:05 AM',
    price: 18,
  ),
  Order(
    productId: '7',
    productName: 'Product 7',
    customerName: 'Customer 7',
    status: Status.pending,
    date: '11:05 AM',
    price: 19,
  ),
  Order(
    productId: '8',
    productName: 'Product 8',
    customerName: 'Customer 8',
    status: Status.delivered,
    date: '11:05 AM',
    price: 16,
  ),
];
