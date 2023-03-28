import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Home Screen",
      style: TextStyle(
        color: ThemeColors.dark,
      ),
    );
  }
}
