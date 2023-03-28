import 'package:flutter/material.dart';
import 'theme/colors.dart';
import './layouts/screen_layout.dart';
import './screens/home.dart';
import './screens/wallets.dart';
import './screens/transact.dart';
import 'screens/card.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "APZ Pay",
      home: Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ScreenLayout(title: "Home", widget: Home()),
    ScreenLayout(title: "My Wallets", widget: Wallets()),
    ScreenLayout(title: "My Virtual Card", widget: MyCard()),
    Transact(),
  ];

  void _onItemTapped(BuildContext ctx, int index) {
    if (index < 4) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      //TODO: open options menu
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            Positioned(
              bottom: 4,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  width: 260,
                  height: 150,
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
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(14),
                            child: Image.network(
                              "https://picsum.photos/200",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: const Text(
                          "Naidoo Koobandra",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        selectedColor: ThemeColors.white,
                        hoverColor: ThemeColors.primary,
                        focusColor: ThemeColors.primary,
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text(
                          "Settings",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        selectedColor: ThemeColors.white,
                        hoverColor: ThemeColors.primary,
                        focusColor: ThemeColors.primary,
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.arrow_back),
                        title: const Text(
                          "Logout",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        selectedColor: ThemeColors.white,
                        hoverColor: ThemeColors.primary,
                        focusColor: ThemeColors.primary,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            )
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
            icon: Icon(Icons.card_giftcard_outlined),
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
