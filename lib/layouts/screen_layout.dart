import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              padding: const EdgeInsets.only(top: 20, left: 15),
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
            top: 55,
            left: 0,
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: widget,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
