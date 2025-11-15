import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          //TODO - Add quantity
          'Total Items (QTY)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        //TODO - Add WoltModalSheet
        PrimaryElevatedIconBtn(
          onPressed: () {},
          icon: Icons.add,
          btnLabel: 'Add new product',
        ),
      ],
    );
  }
}
