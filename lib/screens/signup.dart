import 'package:flutter/material.dart';
import '../components/auth_tabs.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _selectedTab = 0;

  void onTabChanged(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AuthTabs(onTabChanged: onTabChanged),
      ),
      body: Container(),
    );
  }
}
