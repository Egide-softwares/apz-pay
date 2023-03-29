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
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: ListView.builder(
            itemCount: 40,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'Text $index',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
