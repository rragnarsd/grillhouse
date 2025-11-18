import 'package:flutter/material.dart';

class MenuStarRating extends StatelessWidget {
  const MenuStarRating({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: <Widget>[
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const Icon(Icons.star_half, color: Colors.amber, size: 20),
        const Icon(Icons.star_border, color: Colors.amber, size: 20),
        const SizedBox(width: 8),
        Text(
          '(12 Reviews)',
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
