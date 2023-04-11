import 'package:apz_pay/redux/actions/pop_bottom_tab_history_action.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/tuple.dart';

class PurchaseOptions extends StatefulWidget {
  const PurchaseOptions({super.key});

  @override
  State<PurchaseOptions> createState() => _PurchaseOptionsState();
}

class _PurchaseOptionsState extends State<PurchaseOptions> {
  @override
  Widget build(BuildContext context) {
    final List<Tuple<Widget, String, VoidCallback>> options = [
      Tuple(
        const Icon(Icons.network_cell_outlined),
        "Airtime or Data",
        () => {},
      ),
      Tuple(
        const Icon(Icons.electric_bike_outlined),
        "Electricity",
        () => {},
      ),
      Tuple(
        const Icon(Icons.water_outlined),
        "Water",
        () => {},
      ),
    ];

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
                    onPressed: () => {
                      StoreProvider.dispatch(
                        context,
                        PopBottomTabHistoryAction(),
                      )
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const Text(
                    "Buy Airtime, Data, Electricity or Water",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "What would you like to buy?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ...options.map(
                (tuple) => Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 15,
                    right: 20,
                  ),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 23,
                          horizontal: 15,
                        ),
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
        ),
      ],
    );
  }
}
