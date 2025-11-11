import 'package:flutter/material.dart';

class Reservation {
  final String name;
  final String email;
  final int numberOfPeople;
  final String contactNumber;
  final ReservationStatus status;

  Reservation({
    required this.name,
    required this.email,
    required this.numberOfPeople,
    required this.contactNumber,
    required this.status,
  });
}

final List<Reservation> reservations = <Reservation>[
  Reservation(
    name: 'Samantha',
    email: 'samantha@example.com',
    numberOfPeople: 2,
    contactNumber: '1234567890',
    status: ReservationStatus.accept,
  ),
  Reservation(
    name: 'Bruce',
    email: 'bruce@example.com',
    numberOfPeople: 4,
    contactNumber: '9876543210',
    status: ReservationStatus.accept,
  ),
  Reservation(
    name: 'Jim Doe',
    email: 'jim.doe@example.com',
    numberOfPeople: 6,
    contactNumber: '5551234567',
    status: ReservationStatus.cancel,
  ),
  Reservation(
    name: 'Alice Smith',
    email: 'alice.smith@example.com',
    numberOfPeople: 3,
    contactNumber: '4442221111',
    status: ReservationStatus.cancel,
  ),
  Reservation(
    name: 'Bob Johnson',
    email: 'bob.johnson@example.com',
    numberOfPeople: 5,
    contactNumber: '3334445555',
    status: ReservationStatus.accept,
  ),
  Reservation(
    name: 'Charlie Brown',
    email: 'charlie.brown@example.com',
    numberOfPeople: 2,
    contactNumber: '1112223333',
    status: ReservationStatus.accept,
  ),
  Reservation(
    name: 'Diana Prince',
    email: 'diana.prince@example.com',
    numberOfPeople: 8,
    contactNumber: '2223334444',
    status: ReservationStatus.accept,
  ),
  Reservation(
    name: 'Ethan Hunt',
    email: 'ethan.hunt@example.com',
    numberOfPeople: 1,
    contactNumber: '7778889999',
    status: ReservationStatus.cancel,
  ),
  Reservation(
    name: 'Fiona Gallagher',
    email: 'fiona@example.com',
    numberOfPeople: 7,
    contactNumber: '8889990000',
    status: ReservationStatus.accept,
  ),
  Reservation(
    name: 'George Miller',
    email: 'george.miller@example.com',
    numberOfPeople: 4,
    contactNumber: '6667778888',
    status: ReservationStatus.accept,
  ),
];

enum ReservationStatus {
  accept('Accept', Colors.green),
  cancel('Cancel', Colors.red);

  final String displayName;
  final Color color;

  const ReservationStatus(this.displayName, this.color);
}
