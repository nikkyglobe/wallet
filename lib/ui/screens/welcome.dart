import 'package:fiverr_test/ui/screens/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            // color: Colors.black87,
            // colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35.0,
              top: 80,
              right: 55,
            ),
            child: ListView(
              children: <Widget>[
                Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'To the wallet',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 85,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Let\'s begin',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 15,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
