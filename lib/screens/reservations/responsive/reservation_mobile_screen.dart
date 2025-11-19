import 'package:flutter/material.dart';
import 'package:grill_house/screens/reservations/widgets/reservation_table.dart';

class ReservationMobileScreen extends StatelessWidget {
  const ReservationMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[const ReservationTable(), const SizedBox(height: 24)],
    );
  }
}
