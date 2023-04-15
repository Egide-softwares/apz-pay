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
              "https://upload.wikimedia.org/wikipedia/commons/6/6d/Indonesian_passport_data_page.jpg",
          selfieURL:
              "https://assets.website-files.com/6320c9d25c243e328157e175/6320c9d25c243e17dc57e8a6_Tim%20Photo%20square.jpg",
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi ${widget.user?.firstName}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        "Here's your personal details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Your identity verification status",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            widget.user!.isVerified
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: ThemeColors.primary,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "KYC ${widget.user!.isVerified ? 'completed' : 'not completed'}",
                              style: TextStyle(color: ThemeColors.dark),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Your personal details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("First Name"),
                            Text(
                              widget.user!.firstName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Last Name"),
                            Text(
                              widget.user!.lastName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email Address"),
                            Text(
                              widget.user!.email,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("ID/Passport Number"),
                            Text(
                              widget.user!.idNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: widget.user!.idURL != null ||
                            widget.user!.selfieURL != null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Visibility(
                                  visible: widget.user!.idURL != null,
                                  child: Container(
                                    height: 150,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: ThemeColors.lightGrey,
                                      ),
                                    ),
                                    child: Image.network(
                                      widget.user!.idURL!,
                                      scale: 1.0,
                                      repeat: ImageRepeat.noRepeat,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Visibility(
                                  visible: widget.user!.selfieURL != null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 150,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: ThemeColors.lightGrey,
                                        ),
                                      ),
                                      child: Image.network(
                                        widget.user!.selfieURL!,
                                        scale: 1.0,
                                        repeat: ImageRepeat.noRepeat,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
