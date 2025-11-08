import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, this.isMobile = false});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return !isMobile
        ? const Expanded(child: HomeCardItem())
        : const HomeCardItem();
  }
}

class HomeCardItem extends StatelessWidget {
  const HomeCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Sales Total'),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Price: \$100'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        Text('Total: \$1000'),
                      ],
                    ),
                    SizedBox(width: 135, child: Text('Quantity: 10')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
