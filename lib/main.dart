import 'package:fiverr_test/locator.dart';
import 'package:fiverr_test/services/dialog_service.dart';
import 'package:fiverr_test/services/navigation_service.dart';
import 'package:fiverr_test/ui/router.dart';
import 'package:fiverr_test/ui/screens/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'managers/dialog_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Register all the models and services before the app starts
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet app',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Montserrat',
            ),
      ),
      home: IntroScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
