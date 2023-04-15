import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../../redux/actions/pop_bottom_tab_history_action.dart';
import '../../theme/colors.dart';

class PayQrCode extends StatefulWidget {
  const PayQrCode({super.key});

  @override
  State<PayQrCode> createState() => _PayQrCodeState();
}

class _PayQrCodeState extends State<PayQrCode> {
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
                  const Text("Pay a QR code"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.qr_code, size: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Text(
                        "Scan the QR code",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: ThemeColors.dark.withAlpha(150),
                      ),
                    ),
                    Center(
                      child: Positioned(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: ThemeColors.white,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                backgroundColor: ThemeColors.primary,
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: ThemeColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: ThemeColors.primary),
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
