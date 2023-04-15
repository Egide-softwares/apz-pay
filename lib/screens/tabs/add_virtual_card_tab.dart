import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import '../../redux/actions/pop_bottom_tab_history_action.dart';
import '../../theme/colors.dart';

class AddVirtualCard extends StatefulWidget {
  const AddVirtualCard({super.key});

  @override
  State<AddVirtualCard> createState() => _AddVirtualCardState();
}

class _AddVirtualCardState extends State<AddVirtualCard> {
  int _step = 1;

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
                    "Create a Virtual Card",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Visibility(
                visible: _step == 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Icon(
                            Icons.payment,
                            color: ThemeColors.primary,
                            size: 60,
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            "You don't have a virtual card.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Center(
                          child: Text(
                            "Use your virtual card to shop online securely, pay QR codes or tap and pay with your phone.",
                            maxLines: 10,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            "Easily top up your card using wallet.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
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
                                labelText: "Name your virtual card wallet",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
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
                            "Create my virtual card",
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
                child: Placeholder(
                  color: ThemeColors.red,
                  fallbackHeight: 200,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
