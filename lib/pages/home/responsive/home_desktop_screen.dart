import 'package:dashboard/pages/home/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Row(
          children: <Widget>[
            HomeCard(),
            SizedBox(width: 16),
            HomeCard(),
            SizedBox(width: 16),
            HomeCard(),
            SizedBox(width: 16),
            HomeCard(),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SizedBox(height: 400, child: Text('hæ')),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SizedBox(height: 400, child: Text('hæ')),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SizedBox(height: 400, child: Text('hæ')),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              flex: 2,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SizedBox(height: 400, child: Text('hæ')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
