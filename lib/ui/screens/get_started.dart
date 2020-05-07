import 'package:fiverr_test/global.dart';
import 'package:fiverr_test/ui/screens/welcome.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 55.0,
            bottom: 20.0,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoardingInstructions.length,
                  itemBuilder: (context, i) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${onBoardingInstructions[i].title}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Flexible(
                        child: Image.asset(
                          "${onBoardingInstructions[i].image}",
                          scale: 0.7,
                        ),
                      ),
                      Text(
                        "${onBoardingInstructions[i].subtitle}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.grey, fontSize: 20.0),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 35.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingInstructions.length,
                          (f) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              shape:
                                  f == i ? BoxShape.rectangle : BoxShape.circle,
                              color: f == i ? Colors.pinkAccent : Colors.grey,
                              borderRadius:
                                  f == i ? BorderRadius.circular(5.0) : null,
                            ),
                            width: f == i ? 5 : 5,
                            height: 5,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.pinkAccent,
                  child: Text(
                    "Get started",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  onPressed: () {
                    if (onBoardingInstructions.length - 1 ==
                        _pageController.page) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Welcome()));
                    } else
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
