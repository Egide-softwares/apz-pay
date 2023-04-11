import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../redux/actions/select_bottom_tab_action.dart';
import '../redux/state/app_state.dart';
import '../utils/enums.dart';
import '../utils/pair.dart';
import '../utils/tuple.dart';
import '../models/wallet.dart';
import '../theme/colors.dart';

class HomeConnector extends StatelessWidget {
  const HomeConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => Home(
        selectTab: vm.selectTab,
      ),
    );
  }
}

class Factory extends VmFactory<AppState, HomeConnector, ViewModel> {
  Factory(connector) : super(connector);

  @override
  ViewModel fromStore() => ViewModel(
        selectTab: (SelectedTab tab) => dispatch(
          SelectBottomTabAction(selectedTab: tab),
        ),
      );
}

class ViewModel extends Vm {
  final int key;
  final void Function(SelectedTab) selectTab;

  ViewModel({
    this.key = 0,
    required this.selectTab,
  }) : super(equals: [key]);
}

List<Wallet> wallets = <Wallet>[
  const Wallet("FDADFSA", 13224, 13064, "R"),
  const Wallet("nice wallet", 210, 210, "R"),
];

class Home extends StatefulWidget {
  const Home({super.key, required this.selectTab});

  final void Function(SelectedTab) selectTab;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  final List<Widget> _walletSlides = wallets
      .map(
        (e) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.wallet),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 7),
                              child: Text("Balance"),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 7),
                              child: Text("Available"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "${e.currencySymbol.toString()} ${e.balance.toString()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            "${e.currencySymbol.toString()} ${e.available.toString()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final List<Pair<String, VoidCallback>> addButtons = [
      Pair("Add a Virtual Card", () => {}),
      Pair("Add a Physical Card", () => {}),
      Pair("Add Another Wallet", () => {}),
    ];

    final List<Tuple<Widget, String, VoidCallback>> actionButtons = [
      Tuple(const Icon(Icons.qr_code), "Pay a QR code", () => {}),
      Tuple(
        const Icon(Icons.money),
        "Get paid with your QR code",
        () => {},
      ),
      Tuple(
        const Icon(Icons.shopping_basket),
        "Buy Airtime, Data or Electricity",
        () => {},
      ),
      Tuple(
        const Icon(Icons.list),
        "Pay a Bill",
        () => {widget.selectTab(SelectedTab.payBill)},
      ),
      Tuple(
        const Icon(Icons.history),
        "Transaction History",
        () => {widget.selectTab(SelectedTab.transact)},
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: GestureDetector(
              onTap: () => {},
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
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        child: PageView(
                          controller: _controller,
                          children: _walletSlides,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _walletSlides.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(
                                  left: (index % 2 != 0 ? 10 : 0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentPage = index;
                                        _controller.animateToPage(
                                          index,
                                          duration: const Duration(
                                            seconds: 1,
                                            milliseconds: 500,
                                          ),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                        );
                                      });
                                    },
                                    child: Container(
                                      width: 11,
                                      height: 11,
                                      decoration: BoxDecoration(
                                        color: (_currentPage == index)
                                            ? ThemeColors.dark.withAlpha(100)
                                            : ThemeColors.lightGrey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ...actionButtons.map(
            (tuple) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GestureDetector(
                onTap: tuple.third,
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
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: tuple.first,
                        ),
                        Expanded(
                          child: Text(
                            tuple.second,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ...addButtons.map(
            (pair) => Padding(
              padding: EdgeInsets.only(
                top: (addButtons.indexOf(pair) > 0 ? 15 : 0),
              ),
              child: GestureDetector(
                onTap: pair.right,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: ThemeColors.white,
                    border: Border.all(color: ThemeColors.primary),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.add_circle_outline,
                          color: ThemeColors.primary,
                        ),
                      ),
                      Text(
                        pair.left,
                        style: TextStyle(
                          color: ThemeColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
