import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.imageURL,
      required this.title,
      required this.details});
  final String imageURL;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(imageURL, height: 70, width: 70),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(details),
          ],
        )
      ],
    );
  }
}
