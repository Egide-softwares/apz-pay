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
                child: Placeholder(
                  color: ThemeColors.primary,
                  fallbackHeight: 200,
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
