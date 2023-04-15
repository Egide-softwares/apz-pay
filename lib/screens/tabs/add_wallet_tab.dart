import 'package:apz_pay/utils/enums.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../../redux/actions/pop_bottom_tab_history_action.dart';
import '../../theme/colors.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  int _step = 1;
  WalletType _walletType = WalletType.virtualCardWallet;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: ThemeColors.white,
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    bottom: BorderSide(color: ThemeColors.lightGrey),
                    right: BorderSide.none,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      if (_step == 2) {
                        setState(() {
                          _step = 1;
                        });
                      } else {
                        StoreProvider.dispatch(
                          context,
                          PopBottomTabHistoryAction(),
                        );
                      }
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const Text(
                    "Create a Wallet",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Visibility(
                visible: _step == 1,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "What kind of wallet would you like to create?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        title: const Text('Virtual Card Wallet'),
                        leading: Radio(
                          value: WalletType.virtualCardWallet,
                          activeColor: ThemeColors.primary,
                          groupValue: _walletType,
                          onChanged: (WalletType? value) {
                            setState(() {
                              _walletType = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Wallet Only'),
                        leading: Radio(
                          activeColor: ThemeColors.primary,
                          value: WalletType.walletOnly,
                          groupValue: _walletType,
                          onChanged: (WalletType? value) {
                            setState(() {
                              _walletType = value!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: ThemeColors.lightGrey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 7,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Give your wallet a name",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _step = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 23,
                              vertical: 23,
                            ),
                            backgroundColor: ThemeColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(color: ThemeColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _step == 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: Icon(
                          Icons.wallet,
                          color: ThemeColors.primary,
                          size: 60,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "You're about to create a new ${_walletType == WalletType.virtualCardWallet ? 'Virtual Card Wallet' : 'Wallet only'}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: ThemeColors.primary,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  surfaceTintColor: ThemeColors.primary,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 23,
                                    vertical: 23,
                                  ),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: ThemeColors.primary),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                            color: Colors.transparent,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 23,
                                  vertical: 23,
                                ),
                                backgroundColor: ThemeColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(color: ThemeColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
