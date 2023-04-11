import 'package:apz_pay/utils/enums.dart';
import 'package:async_redux/async_redux.dart';
import '../state/app_state.dart';

class SelectBottomTabAction extends ReduxAction<AppState> {
  final SelectedTab selectedTab;

  SelectBottomTabAction({required this.selectedTab});

  @override
  AppState? reduce() {
    return state.copy(selectedBottomTab: selectedTab);
  }
}
