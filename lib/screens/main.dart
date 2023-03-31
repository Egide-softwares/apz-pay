import 'package:apz_pay/utils/tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';
import '../layouts/screen_layout.dart';
import 'home_tab.dart';
import 'wallets_tab.dart';
import 'transact_tab.dart';
import 'card_tab.dart';
import './signin.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  bool _showMoreOptions = false;

  static const List<Widget> _widgetOptions = <Widget>[
    ScreenLayout(title: "Home", widget: Home()),
    ScreenLayout(title: "My Wallets", widget: Wallets()),
    ScreenLayout(title: "My Virtual Card", widget: MyCard()),
    Transact(),
  ];

  static final List<Tuple<Widget, String, Function(BuildContext ctx)>>
      _options = [
    Tuple(
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(
            "assets/images/default_avatar.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      "Naidoo Koobandra",
      (BuildContext ctx) {},
    ),
    Tuple(const Icon(Icons.settings), "Settings", (BuildContext ctx) {}),
    Tuple(
      const Icon(Icons.arrow_back),
      "Logout",
      (BuildContext ctx) {
        Navigator.of(ctx).push(
          MaterialPageRoute<void>(
            builder: (BuildContext ctx) => const Signin(),
          ),
        );
      },
    ),
  ];

  void _onItemTapped(BuildContext ctx, int index) {
    setState(() {
      if (index < 4) {
        _selectedIndex = index;
      } else {
        _showMoreOptions = !_showMoreOptions;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primary,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        top: true,
        left: true,
        bottom: true,
        right: true,
        child: Stack(
          children: [
            Positioned.fill(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            Positioned(
              bottom: 4,
              right: 0,
              child: Visibility(
                visible: _showMoreOptions,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
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
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        children: _options
                            .map(
                              (e) => ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: e.first,
                                ),
                                title: Text(
                                  e.second,
                                  style: TextStyle(
                                    color: ThemeColors.dark,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                onTap: () {
                                  e.third(context);
                                  setState(() {
                                    _showMoreOptions = !_showMoreOptions;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_outlined),
            label: 'My Wallets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'My Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_outlined),
            label: 'Transact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert_outlined),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ThemeColors.primary,
        unselectedItemColor: ThemeColors.dark,
        showUnselectedLabels: true,
        onTap: (index) {
          _onItemTapped(context, index);
        },
      ),
    );
  }
}
