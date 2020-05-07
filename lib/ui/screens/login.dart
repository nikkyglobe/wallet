import 'package:fiverr_test/locator.dart';
import 'package:fiverr_test/services/local_auth_services.dart';
import 'package:fiverr_test/ui/screens/signup.dart';
import 'package:fiverr_test/ui/widgets/busy_button.dart';
import 'package:fiverr_test/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  final TextEditingController _emailController =
      TextEditingController(text: '');

  final LocalAuthenticationService _localAuth =
      locator<LocalAuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModelBuilder: () {
        return LoginViewModel();
      },
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(
              // left: 20.0,
              // right: 20.0,
              top: 20.0,
              // bottom: 20.0,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "Email"),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "Password"),
                          obscureText: true,
                          controller: _passwordController,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot?',
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: BusyButton(
                            title: 'Login',
                            busy: model.busy,
                            onPressed: () {
                              model.login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'touch sensor instead',
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              child: IconButton(
                                icon: Icon(
                                  Icons.fingerprint,
                                  size: 60,
                                  color: Colors.pinkAccent,
                                ),
                                onPressed: _localAuth.authenticate,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: WaveClipperTwo(reverse: true),
                      child: Container(
                        height: 175,
                        color: Colors.pink[50],
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      width: MediaQuery.of(context).size.width,
                      child: ClipPath(
                        clipper: WaveClipperTwo(reverse: true),
                        child: Container(
                          height: 155,
                          color: Colors.pink[100],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      width: MediaQuery.of(context).size.width,
                      child: ClipPath(
                        clipper: WaveClipperTwo(reverse: true),
                        child: Container(
                          height: 135,
                          color: Colors.pinkAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
