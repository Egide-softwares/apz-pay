import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../../redux/actions/pop_bottom_tab_history_action.dart';
import '../../theme/colors.dart';

class GetPaidByQrCode extends StatefulWidget {
  const GetPaidByQrCode({super.key});

  @override
  State<GetPaidByQrCode> createState() => _GetPaidByQrCodeState();
}

class _GetPaidByQrCodeState extends State<GetPaidByQrCode> {
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
                child: Divider(
                  color: ThemeColors.lightGrey,
                  height: 1,
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
                  const Text("Get Paid with your QR code"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "How would you like to be paid?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "How much would you like to be paid?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColors.lightGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Amount",
                              prefix: Text("R"),
                              suffix: Text(".00"),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: ThemeColors.lightGrey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(7),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Payment reference (optional)",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
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
                          "Generate QR code",
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
    );
  }
}
