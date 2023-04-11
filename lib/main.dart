import 'package:async_redux/async_redux.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import './theme/colors.dart';
import './screens/signin.dart';
import 'redux/state/app_state.dart';

late Store<AppState> store;

void main() {
  store = Store<AppState>(
    initialState: AppState.initialState(),
  );
  NavigateAction.setNavigatorKey(GlobalKey<NavigatorState>());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "APZ Pay",
        theme: ThemeData(
          fontFamily: "Poppins",
          primaryColor: ThemeColors.primary,
          useMaterial3: true,
        ),
        home: const Signin(),
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale("en"),
          Locale("fr"),
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
        ],
      ),
    );
  }
}
