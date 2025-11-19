import 'package:flutter/material.dart';
import 'package:grill_house/screens/reservations/widgets/reservation_table.dart';

class ReservationTabletScreen extends StatelessWidget {
  const ReservationTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[const ReservationTable(), const SizedBox(height: 24)],
    );
  }
}
