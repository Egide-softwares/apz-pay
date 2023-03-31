import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../components/auth_tabs.dart';
import '../theme/colors.dart';
import './signup.dart';
import './main.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  int _selectedTab = 0;
  bool _hidePassword = true;
  String _phonePrefix = "+27";

  void onTabChanged(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AuthTabs(onTabChanged: onTabChanged),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "Welcome\nBack!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                leadingDistribution: TextLeadingDistribution.even,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Sign in with your ${_selectedTab == 0 ? "phone numer" : "email"} and password",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Form(
              child: Column(
                children: [
                  Visibility(
                    visible: _selectedTab == 0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColors.lightGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (!RegExp(r'^[0-9]+$').hasMatch("$value")) {
                                return "Inavlid phone number";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              prefixIcon: CountryCodePicker(
                                initialSelection: "ZA",
                                favorite: const ["ZA"],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                                onChanged: (countryCode) {
                                  setState(() {
                                    _phonePrefix =
                                        countryCode.dialCode.toString();
                                  });
                                },
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _selectedTab == 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColors.lightGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: ThemeColors.lightGrey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                obscureText: _hidePassword,
                                obscuringCharacter: "*",
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: "Password",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                icon: Icon(_hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _hidePassword = !_hidePassword;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext ctx) => const Main(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(23),
                backgroundColor: ThemeColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(color: ThemeColors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Forgot your password? "),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Reset it here",
                          style: TextStyle(
                            color: ThemeColors.primary,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Is your account not set up yet? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext ctx) => const SignUp(),
                              ),
                            );
                          },
                          child: Text(
                            "Register here",
                            style: TextStyle(
                              color: ThemeColors.primary,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
