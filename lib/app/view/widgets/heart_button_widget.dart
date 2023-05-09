import 'package:flutter/material.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({super.key});

  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          // Here we changing the icon.
          toggle = !toggle;
        });
      },
      icon: toggle
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
    );
  }
}
