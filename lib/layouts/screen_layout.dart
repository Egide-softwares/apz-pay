import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ThemeColors.white),
      child: Stack(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ThemeColors.primary,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.elliptical(100, 40),
                bottomRight: Radius.elliptical(100, 40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                title,
                style: TextStyle(
                  color: ThemeColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            bottom: -7,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColors.white,
                  boxShadow: List.filled(
                    4,
                    BoxShadow(
                      color: ThemeColors.dark.withOpacity(0.05),
                      blurRadius: 4,
                      offset: Offset.fromDirection(2),
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: widget,
              ),
            ),
          )
        ],
      ),
    );
  }
}
