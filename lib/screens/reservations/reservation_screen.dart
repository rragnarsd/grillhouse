import 'package:dashboard/screens/reservations/responsive/reservation_desktop_screen.dart';
import 'package:dashboard/screens/reservations/responsive/reservation_mobile_screen.dart';
import 'package:dashboard/screens/reservations/responsive/reservation_tablet_screen.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const ReservationDesktopScreen()
        : Responsive.isTablet(context)
        ? const ReservationTabletScreen()
        : const ReservationMobileScreen();
  }
}
