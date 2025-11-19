import 'package:flutter/material.dart';
import 'package:grill_house/screens/reservations/widgets/reservation_table.dart';

class ReservationDesktopScreen extends StatelessWidget {
  const ReservationDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1366),
      child: ListView(
        children: <Widget>[
          const ReservationTable(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
