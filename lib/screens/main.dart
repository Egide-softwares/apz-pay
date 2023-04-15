import 'package:apz_pay/screens/tabs/add_virtual_card_tab.dart';
import 'package:apz_pay/screens/tabs/add_wallet_tab.dart';
import 'package:apz_pay/screens/tabs/get_paid_tab.dart';
import 'package:apz_pay/screens/tabs/pay_qrcode_tab.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';
import '../layouts/screen_layout.dart';
import '../redux/actions/select_bottom_tab_action.dart';
import '../redux/state/app_state.dart';
import '../utils/enums.dart';
import '../utils/tuple.dart';
import 'tabs/buy_tab.dart';
import 'tabs/pay_bill_tab.dart';
import 'tabs/wallet_tab.dart';
import 'tabs/home_tab.dart';
import 'tabs/wallets_tab.dart';
import 'tabs/transact_tab.dart';
import 'tabs/card_tab.dart';
import 'tabs/profile_tab.dart';
import 'signin.dart';

/// Main Widget Store Connector
class MainConnector extends StatelessWidget {
  const MainConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => Main(
        selectedBottomTab: vm.selectedBottomTab,
        selectTab: vm.selectTab,
      ),
    );
  }
}

/// MainConnector Factory
class Factory extends VmFactory<AppState, MainConnector, ViewModel> {
  Factory(connector) : super(connector);

  @override
  ViewModel fromStore() => ViewModel(
        selectedBottomTab: state.selectedBottomTab,
        selectTab: (SelectedTab tab) => dispatch(
          SelectBottomTabAction(selectedTab: tab),
        ),
      );
}

/// MainConnector ViewModel
class ViewModel extends Vm {
  final SelectedTab selectedBottomTab;
  final void Function(SelectedTab) selectTab;

  ViewModel({
    required this.selectedBottomTab,
    required this.selectTab,
  }) : super(equals: [selectedBottomTab]);
}

/// Main Widget
class Main extends StatefulWidget {
  const Main({
    super.key,
    required this.selectedBottomTab,
    required this.selectTab,
  });

  final SelectedTab selectedBottomTab;
  final void Function(SelectedTab) selectTab;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  bool _showMoreOptions = false;

  static const Map<SelectedTab, Widget> _tabs = {
    SelectedTab.home: ScreenLayout(
      title: "Home",
      widget: HomeConnector(),
    ),
    SelectedTab.myWallets: ScreenLayout(
      title: "My Wallets",
      widget: WalletsConnector(),
    ),
    SelectedTab.myCard: ScreenLayout(
      title: "My Virtual Card",
      widget: MyCardConnector(),
    ),
    SelectedTab.transact: Transact(),
    SelectedTab.payBill: PayBill(),
    SelectedTab.buy: PurchaseOptions(),
    SelectedTab.myWallet: ScreenLayout(
      title: "My Wallet",
      widget: MyWalletConnector(),
    ),
    SelectedTab.profile: ProfileConnector(),
    SelectedTab.payQrCode: PayQrCode(),
    SelectedTab.receivePaymentByQrCode: GetPaidByQrCode(),
    SelectedTab.addVirtualCard: AddVirtualCard(),
    SelectedTab.addWallet: AddWallet()
  };

  static final List<Tuple<Widget?, String, Function(BuildContext ctx)>>
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
      (BuildContext ctx) {
        StoreProvider.dispatch(
          ctx,
          SelectBottomTabAction(selectedTab: SelectedTab.profile),
        );
      },
    ),
    Tuple(const Icon(Icons.settings), "Settings", (BuildContext ctx) {}),
    Tuple(
      null,
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

  void _onItemTapped(int index) {
    if (index != 4) {
      widget.selectTab(SelectedTab.values.elementAt(index));
    } else {
      setState(() {
        _showMoreOptions = !_showMoreOptions;
      });
    }
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
              child: _tabs[widget.selectedBottomTab]!,
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
                                  padding: EdgeInsets.only(
                                    right: e.first != null ? 10 : 0,
                                  ),
                                  child: e.first,
                                ),
                                title: Text(
                                  e.second,
                                  style: TextStyle(
                                    color: e.first != null
                                        ? ThemeColors.dark
                                        : ThemeColors.red,
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
        currentIndex: widget.selectedBottomTab.index <= 4
            ? widget.selectedBottomTab.index
            : 4,
        selectedItemColor: widget.selectedBottomTab.index <= 4
            ? ThemeColors.primary
            : ThemeColors.dark,
        unselectedItemColor: ThemeColors.dark,
        showUnselectedLabels: true,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
