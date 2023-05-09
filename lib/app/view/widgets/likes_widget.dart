import 'package:flutter/material.dart';

class LikesWidget extends StatelessWidget {
  const LikesWidget({super.key, required this.vote_count});
  final String vote_count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.favorite,
          size: 16,
        ),
        const SizedBox(width: 5),
        Text('$vote_count Likes'),
      ],
    );
  }
}
