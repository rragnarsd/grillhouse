import 'package:dashboard/pages/home/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const HomeCard(isMobile: true),
        const SizedBox(height: 16),
        const HomeCard(isMobile: true),
        const SizedBox(height: 16),
        const HomeCard(isMobile: true),
        const SizedBox(height: 16),
        const HomeCard(isMobile: true),
        const SizedBox(height: 16),

        const SizedBox(height: 32),
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const SizedBox(
              height: 400,
              width: double.infinity,
              child: Text('hæ'),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const SizedBox(
              height: 400,
              width: double.infinity,
              child: Text('hæ'),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const SizedBox(
              height: 400,
              width: double.infinity,
              child: Text('hæ'),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const SizedBox(
              height: 400,
              width: double.infinity,
              child: Text('hæ'),
            ),
          ),
        ),
      ],
    );
  }
}
