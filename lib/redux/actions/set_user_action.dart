import 'package:async_redux/async_redux.dart';
import '../../models/user.dart';
import '../state/app_state.dart';

class SetUserAction extends ReduxAction<AppState> {
  final User user;

  SetUserAction({required this.user});

  @override
  AppState? reduce() {
    return state.copy(user: user);
  }
}
