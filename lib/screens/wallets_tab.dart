import 'package:apz_pay/models/wallet.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Wallets extends StatefulWidget {
  const Wallets({super.key});

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
      padding: const EdgeInsets.all(20),
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
                                            fontWeight: FontWeight.w900,
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