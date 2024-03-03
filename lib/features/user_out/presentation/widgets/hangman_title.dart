import 'package:flutter/material.dart';

class HangmanTitle extends StatelessWidget {
  const HangmanTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hangman",
      style: Theme.of(context)
          .textTheme
          .displaySmall
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}