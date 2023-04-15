import 'package:apz_pay/utils/enums.dart';
import 'package:flutter/foundation.dart';

import '../../models/user.dart';

class AppState {
  final SelectedTab selectedBottomTab;
  final List<SelectedTab> selectedBottomTabHistory;
  final User? user;

  AppState({
    required this.selectedBottomTabHistory,
    required this.selectedBottomTab,
    required this.user,
  });

  AppState copy({
    SelectedTab? selectedBottomTab,
    List<SelectedTab>? selectedBottomTabHistory,
    User? user,
  }) {
    return AppState(
        selectedBottomTab: selectedBottomTab ?? this.selectedBottomTab,
        selectedBottomTabHistory: selectedBottomTabHistory ??
            (selectedBottomTab != null
                ? [...this.selectedBottomTabHistory, selectedBottomTab]
                : this.selectedBottomTabHistory),
        user: user ?? this.user);
  }

  static AppState initialState() {
    return AppState(
      selectedBottomTab: SelectedTab.home,
      selectedBottomTabHistory: [SelectedTab.home],
      user: null,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AppState &&
            (runtimeType == other.runtimeType) &&
            (selectedBottomTab == other.selectedBottomTab) &&
            (listEquals(
                selectedBottomTabHistory, other.selectedBottomTabHistory)) &&
            (user == other.user));
  }

  @override
  int get hashCode => (selectedBottomTab.hashCode +
      selectedBottomTabHistory.hashCode +
      user.hashCode);
}
