import 'package:apz_pay/theme/colors.dart';
import 'package:flutter/material.dart';

class AuthTabs extends StatefulWidget {
  const AuthTabs({super.key, required this.onTabChanged});

  final Function(int) onTabChanged;

  @override
  State<AuthTabs> createState() => _AuthTabsState();
}

class _AuthTabsState extends State<AuthTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ThemeColors.lightGrey,
              width: 1.0,
            ),
          ),
        ),
        child: TabBar(
          dividerColor: ThemeColors.lightGrey,
          indicatorColor: ThemeColors.primary,
          labelColor: ThemeColors.primary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4,
          onTap: (index) {
            widget.onTabChanged(index);
          },
          tabs: const [
            Tab(
              text: "Phone Number",
            ),
            Tab(
              text: "Email",
            ),
          ],
        ),
      ),
    );
  }
}
