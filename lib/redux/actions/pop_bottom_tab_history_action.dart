import 'package:async_redux/async_redux.dart';

import '../state/app_state.dart';

class PopBottomTabHistoryAction extends ReduxAction<AppState> {
  PopBottomTabHistoryAction();

  @override
  AppState? reduce() {
    if (state.selectedBottomTabHistory.isEmpty) return null;
    state.selectedBottomTabHistory.removeLast();
    return state.copy(
      selectedBottomTab: state.selectedBottomTabHistory.last,
      selectedBottomTabHistory: state.selectedBottomTabHistory,
    );
  }
}
