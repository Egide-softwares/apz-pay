import 'package:apz_pay/utils/enums.dart';
import 'package:flutter/foundation.dart';

class AppState {
  final SelectedTab selectedBottomTab;
  final List<SelectedTab> selectedBottomTabHistory;

  AppState({
    required this.selectedBottomTabHistory,
    required this.selectedBottomTab,
  });

  AppState copy({
    SelectedTab? selectedBottomTab,
    List<SelectedTab>? selectedBottomTabHistory,
  }) {
    return AppState(
      selectedBottomTab: selectedBottomTab ?? this.selectedBottomTab,
      selectedBottomTabHistory: selectedBottomTabHistory ??
          (selectedBottomTab != null
              ? [...this.selectedBottomTabHistory, selectedBottomTab]
              : this.selectedBottomTabHistory),
    );
  }

  static AppState initialState() {
    return AppState(
      selectedBottomTab: SelectedTab.home,
      selectedBottomTabHistory: [],
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AppState &&
            (runtimeType == other.runtimeType) &&
            (selectedBottomTab == other.selectedBottomTab) &&
            (listEquals(
                selectedBottomTabHistory, other.selectedBottomTabHistory)));
  }

  @override
  int get hashCode =>
      (selectedBottomTab.hashCode + selectedBottomTabHistory.hashCode);
}
