import 'package:apz_pay/redux/actions/pop_bottom_tab_history_action.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/tuple.dart';

class PayBill extends StatefulWidget {
  const PayBill({super.key});

  @override
  State<PayBill> createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
  @override
  Widget build(BuildContext context) {
    final List<Tuple<Widget, String, VoidCallback>> options = [
      Tuple(
        Image.asset("assets/images/easy-pay.jpg", width: 35, height: 30),
        "Pay your EasyPay Bills",
        () => {},
      ),
      Tuple(
        Image.asset("assets/images/pay-at.jpg", width: 35, height: 30),
        "Pay your Pay@Bills",
        () => {},
      ),
      Tuple(
        Image.asset("assets/images/financial.jpg", width: 35, height: 30),
        "Financial Services",
        () => {},
      ),
      Tuple(
        Image.asset("assets/images/municipality.jpg", width: 35, height: 30),
        "Municipalities",
        () => {},
      ),
      Tuple(
        const Icon(Icons.computer_outlined),
        "Television",
        () => {},
      ),
      Tuple(
        const Icon(Icons.shopping_cart_outlined),
        "Retail",
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
                  const Text("Pay bill"),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "Select a Provider",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ...options.map(
                (tuple) => Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 15,
                    right: 15,
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
                          vertical: 17,
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
