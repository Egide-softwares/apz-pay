import 'package:apz_pay/redux/actions/pop_bottom_tab_history_action.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Transact extends StatefulWidget {
  const Transact({super.key});

  @override
  State<Transact> createState() => _TransactState();
}

class _TransactState extends State<Transact> {
  final List<String> _cards = <String>[
    "Virtual Card 1",
    "Virtual Card 2",
    "Virtual Card 3"
  ];

  String _selectedCardWallet = "Virtual Card 1";

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
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: IconButton(
                      onPressed: () => {
                        StoreProvider.dispatch(
                          context,
                          PopBottomTabHistoryAction(),
                        )
                      },
                      icon: const Icon(Icons.chevron_left),
                    ),
                  ),
                  const Text(
                    "Transaction history",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ThemeColors.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(5),
                    decoration: InputDecoration(
                      fillColor: ThemeColors.white,
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    value: _selectedCardWallet,
                    items: _cards
                        .map(
                          (cardName) => DropdownMenuItem(
                            value: cardName,
                            child: Text(
                              cardName,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCardWallet = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Latest transactions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ThemeColors.primary.withAlpha(30),
                ),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Pending",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ...List.generate(
                3,
                (index) => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ThemeColors.white,
                    border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      bottom: BorderSide(
                        color: ThemeColors.primary.withAlpha(30),
                        width: 2,
                      ),
                      right: BorderSide.none,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Description",
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              "2 March 2021",
                              maxLines: 1,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "R 345.34",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ThemeColors.primary.withAlpha(30),
                ),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Latest",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ...List.generate(
                8,
                (index) => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ThemeColors.white,
                    border: Border(
                      top: BorderSide.none,
                      left: BorderSide.none,
                      bottom: BorderSide(
                        color: ThemeColors.primary.withAlpha(30),
                        width: 2,
                      ),
                      right: BorderSide.none,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Description",
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              "2 March 2021",
                              maxLines: 1,
                              style: TextStyle(overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "R 345.34",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.transparent,
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
