import 'package:apz_pay/screens/signin.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/auth_tabs.dart';
import '../theme/colors.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _selectedTab = 0;
  String _phonePrefix = "+27";
  bool _acceptedTerms = false;
  bool _keepUpdated = false;

  void onTabChanged(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primary,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        top: true,
        left: true,
        bottom: true,
        right: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PreferredSize(
              preferredSize: const Size.fromHeight(7),
              child: AuthTabs(onTabChanged: onTabChanged),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "Hey There!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 27),
                    child: Text(
                      "Let's sign you up.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
                                border: Border.all(
                                  color: ThemeColors.lightGrey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3,
                                  horizontal: 7,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (!RegExp(r'^[0-9]+$')
                                        .hasMatch("$value")) {
                                      return "Inavlid phone number";
                                    } else {
                                      return null;
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
                                border:
                                    Border.all(color: ThemeColors.lightGrey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3,
                                  horizontal: 7,
                                ),
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
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 27),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Checkbox(
                                value: _acceptedTerms,
                                activeColor: ThemeColors.primary,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptedTerms = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "I accept the ",
                                        style: TextStyle(
                                          color: ThemeColors.dark,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "terms and conditions",
                                        style: TextStyle(
                                          color: ThemeColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Checkbox(
                                  value: _keepUpdated,
                                  activeColor: ThemeColors.primary,
                                  onChanged: (value) {
                                    setState(() {
                                      _keepUpdated = value!;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "Keep me in the loop with information and promotions",
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: ThemeColors.dark,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext ctx) => const MainConnector(),
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
                      "Let's go",
                      style: TextStyle(color: ThemeColors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext ctx) => const Signin(),
                              ),
                            );
                          },
                          child: Text(
                            "Log in",
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
