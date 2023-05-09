import 'package:flutter/material.dart';

class ViewQuantityWidget extends StatelessWidget {
  const ViewQuantityWidget({super.key, required this.popularity});
  final String popularity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle_rounded,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text('$popularity view'),
      ],
    );
  }
}
