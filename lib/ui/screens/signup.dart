import 'package:country_code_picker/country_code_picker.dart';
import 'package:fiverr_test/ui/widgets/busy_button.dart';
import 'package:fiverr_test/viewmodels/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  // AnimationController _loginButtonController;
  final TextEditingController _phoneController =
      TextEditingController(text: '');
  final TextEditingController _fullNameController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  // final TextEditingController _confirmPasswordController =
  //     TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');

  CountryCode countryCode;
  String phoneNumber;
  String _phone;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // _loginButtonController = AnimationController(
    //   duration: Duration(milliseconds: 3000),
    //   vsync: this,
    // );

    _phone = '';
    countryCode = CountryCode(
      code: 'US',
      dialCode: '+1',
      name: 'United States',
    );
    _phoneController.addListener(() {
      if (_phoneController.text != _phone && _phoneController.text != '') {
        _phone = _phoneController.text;
        onPhoneNumberChange(
          _phone,
          '${countryCode.dialCode}$_phone',
          countryCode.code,
        );
      }
    });
  }

  @override
  void dispose() {
    // _loginButtonController.dispose();
    super.dispose();
  }

  // Future<Null> _playAnimation() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     await _loginButtonController.forward();
  //   } on TickerCanceled {
  //     print('[_playAnimation] error');
  //   }
  // }

  // Future<Null> _stopAnimation() async {
  //   try {
  //     await _loginButtonController.reverse();
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } on TickerCanceled {
  //     print('[_stopAnimation] error');
  //   }
  // }

  // void _failMessage(message, context) {
  //   /// Showing Error messageSnackBarDemo
  //   /// Ability so close message
  //   final snackBar = SnackBar(
  //     content: Text('Warning: $message'),
  //     duration: Duration(seconds: 30),
  //     action: SnackBarAction(
  //       label: 'Close',
  //       onPressed: () {
  //         // Some code to undo the change.
  //       },
  //     ),
  //   );

  //   Scaffold.of(context)
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }

  void onPhoneNumberChange(
    String number,
    String internationalizedPhoneNumber,
    String isoCode,
  ) {
    if (internationalizedPhoneNumber.isNotEmpty) {
      phoneNumber = internationalizedPhoneNumber;
    } else {
      phoneNumber = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModelBuilder: () {
        return SignUpViewModel();
      },
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 45.0,
                bottom: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            countryCode = country;
                          });
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: countryCode.code,
                        //Get the country information relevant to the initial selection
                        onInit: (code) {
                          countryCode = code;
                        },
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: "Phone"),
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Email"),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Full name"),
                      controller: _fullNameController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Password"),
                      obscureText: true,
                      controller: _passwordController,
                    ),
                  ),
                  // SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 12.0,
                  //   ),
                  //   child: TextField(
                  //     decoration:
                  //         InputDecoration(hintText: "Confirm password"),
                  //     obscureText: true,
                  //     controller: _confirmPasswordController,
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Text(
                      "By tapping on 'CREATE' you agree to the Terms of Use and privacy policy"),
                  SizedBox(height: 25),
                  BusyButton(
                      title: 'Create',
                      busy: model.busy,
                      onPressed: () {
                        model.signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                          // confirmPassword: _confirmPasswordController.text,
                          fullName: _fullNameController.text,
                          phone: _phoneController.text,
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
