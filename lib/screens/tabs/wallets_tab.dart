import 'package:apz_pay/models/wallet.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../../redux/actions/select_bottom_tab_action.dart';
import '../../redux/state/app_state.dart';
import '../../theme/colors.dart';
import '../../utils/enums.dart';

class WalletsConnector extends StatelessWidget {
  const WalletsConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => Wallets(
        selectTab: vm.selectTab,
      ),
    );
  }
}

class Factory extends VmFactory<AppState, WalletsConnector, ViewModel> {
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

class Wallets extends StatefulWidget {
  const Wallets({super.key, required this.selectTab});

  final void Function(SelectedTab) selectTab;

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  final List<Wallet> _wallets = <Wallet>[
    const Wallet("FDADFSA", 13224, 13064, "R"),
    const Wallet("nice wallet", 210, 210, "R"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: GestureDetector(
              onTap: () => {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                      "Add Another Wallet",
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
          ..._wallets.map(
            (wallet) => Padding(
              padding: EdgeInsets.only(
                bottom: (_wallets.indexOf(wallet) % 2 == 0 ? 15 : 0),
              ),
              child: GestureDetector(
                onTap: () => {
                  StoreProvider.dispatch(
                    context,
                    SelectBottomTabAction(selectedTab: SelectedTab.myWallet),
                  )
                },
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
                                            textBaseline:
                                                TextBaseline.alphabetic,
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
          ),
        ],
      ),
    );
  }
}
