import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "MyCard Screen",
      style: TextStyle(
        color: ThemeColors.dark,
      ),
    );
  }
}
