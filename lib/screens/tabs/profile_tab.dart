import 'package:apz_pay/redux/actions/set_user_action.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../redux/actions/pop_bottom_tab_history_action.dart';
import '../../redux/state/app_state.dart';
import '../../theme/colors.dart';

class ProfileConnector extends StatelessWidget {
  const ProfileConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => Profile(
        user: vm.user,
      ),
    );
  }
}

class Factory extends VmFactory<AppState, ProfileConnector, ViewModel> {
  Factory(connector) : super(connector);

  @override
  ViewModel fromStore() => ViewModel(
        user: state.user,
      );
}

class ViewModel extends Vm {
  final User? user;

  ViewModel({
    required this.user,
  }) : super(equals: [user]);
}

class Profile extends StatefulWidget {
  const Profile({super.key, required this.user});

  final User? user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(
      context,
      SetUserAction(
        user: User(
          firstName: "Naidoo",
          lastName: "Koobandhra",
          email: "gthecoderkalisaineza@gmail.com",
          idNumber: "6409105090085",
          idURL:
              "https://tenetpay.s3.amazonaws.com/identities/LOCAL_PASSPORT/tenet_identity_1675865310731.png",
          selfieURL:
              "https://tenetpay.s3.amazonaws.com/selfies/selfie_1675835110651.png",
          isVerified: true,
        ),
      ),
    );

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
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Visibility(
                visible: widget.user != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
