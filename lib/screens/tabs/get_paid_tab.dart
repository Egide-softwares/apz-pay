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
            ],
          ),
        ),
      ],
    );
  }
}
