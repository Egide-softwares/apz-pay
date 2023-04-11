import 'package:apz_pay/models/wallet.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../redux/actions/select_bottom_tab_action.dart';
import '../redux/state/app_state.dart';
import '../theme/colors.dart';
import '../utils/enums.dart';
import '../utils/tuple.dart';

class MyCardConnector extends StatelessWidget {
  const MyCardConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => MyCard(
        selectTab: vm.selectTab,
      ),
    );
  }
}

class Factory extends VmFactory<AppState, MyCardConnector, ViewModel> {
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

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.selectTab});

  final void Function(SelectedTab) selectTab;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool _isCardActive = false;
  bool _showCardOptions = false;
  final Wallet wallet = const Wallet("My Wallet", 13224, 13064, "R");

  @override
  Widget build(BuildContext context) {
    final List<Tuple<Widget, String, VoidCallback>> actionButtons = [
      Tuple(const Icon(Icons.payment), "Top Up", () => {}),
      Tuple(const Icon(Icons.compare_arrows_outlined), "Transfer", () => {}),
      Tuple(const Icon(Icons.payment), "Withdraw", () => {}),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.wallet),
                      Expanded(
                        child: Container(
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        wallet.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${wallet.currencySymbol} ${wallet.balance.toString()}",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${wallet.currencySymbol} ${wallet.available.toString()}",
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
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/physical_card.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    width: 230,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.visibility_outlined,
                              color: ThemeColors.red,
                            ),
                          ),
                          Text(
                            "View card details",
                            style: TextStyle(
                              color: ThemeColors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Visibility(
                            visible: _showCardOptions,
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: ThemeColors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: List.filled(
                                  4,
                                  BoxShadow(
                                    color: ThemeColors.dark.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: Offset.fromDirection(2),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  bottom: 15,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _showCardOptions =
                                                  !_showCardOptions;
                                            });
                                          },
                                          icon: const Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                          horizontal: 10,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Cancel Card",
                                        style: TextStyle(
                                          color: ThemeColors.dark,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Change PIN",
                                        style: TextStyle(
                                          color: ThemeColors.dark,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _showCardOptions = !_showCardOptions;
                            });
                          },
                          icon: const Icon(Icons.more_vert_outlined),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Active",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Switch(
                              activeColor: ThemeColors.primary,
                              value: _isCardActive,
                              onChanged: (value) {
                                setState(() {
                                  _isCardActive = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
        ],
      ),
    );
  }
}
