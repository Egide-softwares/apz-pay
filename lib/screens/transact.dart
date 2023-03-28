import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Transact extends StatefulWidget {
  const Transact({super.key});

  @override
  State<Transact> createState() => _TransactState();
}

class _TransactState extends State<Transact> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Transact Screen",
      style: TextStyle(
        color: ThemeColors.dark,
      ),
    );
  }
}
