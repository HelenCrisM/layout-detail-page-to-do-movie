import 'package:flutter/material.dart';
import 'package:layout_detail_film_to_do_movies/app/view/widgets/card_widget.dart';

class ListDetailsWidget extends StatelessWidget {
  const ListDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CardWidget(
          imageURL:
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wfGfxtBkhBzQfOZw4S8IQZgrH0a.jpg',
          title: 'Charlie and the Chocolate Factory',
          details: '2005   Comedy, Family, Fantasy',
        ),
        SizedBox(height: 16),
        CardWidget(
          imageURL:
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/oV0XLQrJpqtOXRTmIH9NBVElvg4.jpg',
          title: 'Corpse Bride',
          details: '2005   Romance, Animation, Fantasy',
        ),
        SizedBox(height: 16),
        CardWidget(
          imageURL:
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/p932ErUJKU3hRsszhYQPJVfddY4.jpg',
          title: 'The Nightmare Before Christmas ',
          details: '1993   Animation, Family, Fantasy',
        ),
      ],
    );
  }
}
