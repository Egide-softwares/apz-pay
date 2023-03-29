import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ThemeColors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: ThemeColors.primary,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
      ),
      onPressed: () {
        onClick();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: icon,
          ),
          Text(
            text,
            style: TextStyle(
              color: ThemeColors.dark,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
