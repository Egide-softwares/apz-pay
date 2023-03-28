import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Wallets extends StatefulWidget {
  const Wallets({super.key});

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Wallets Screen",
      style: TextStyle(
        color: ThemeColors.dark,
      ),
    );
  }
}
