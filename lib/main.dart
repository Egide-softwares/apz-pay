import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/colors.dart';
import './layouts/screen_layout.dart';
import './screens/home.dart';
import './screens/wallets.dart';
import './screens/transact.dart';
import 'screens/card.dart';
import './utils/pair.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "APZ Pay",
      theme: ThemeData(
        primaryColor: ThemeColors.primary,
      ),
      home: const Main(),
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
  bool _showMoreOptions = false;

  static const List<Widget> _widgetOptions = <Widget>[
    ScreenLayout(title: "Home", widget: Home()),
    ScreenLayout(title: "My Wallets", widget: Wallets()),
    ScreenLayout(title: "My Virtual Card", widget: MyCard()),
    Transact(),
  ];

  static final List<Pair<Widget, String>> _options = <Pair<Widget, String>>[
    Pair(
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
    ),
    Pair(const Icon(Icons.settings), "Settings"),
    Pair(const Icon(Icons.arrow_back), "Logout"),
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
                                  child: e.left,
                                ),
                                title: Text(
                                  e.right,
                                  style: TextStyle(
                                    color: ThemeColors.dark,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                onTap: () {
                                  var index = _options.indexOf(e);
                                  if (kDebugMode) {
                                    print("INDEX: $index");
                                  }
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
