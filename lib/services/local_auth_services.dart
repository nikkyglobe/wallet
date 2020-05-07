import 'package:fiverr_test/constants/route_names.dart';
import 'package:fiverr_test/locator.dart';
import 'package:fiverr_test/services/dialog_service.dart';
import 'package:fiverr_test/services/navigation_service.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LocalAuthenticationService {
  final _auth = LocalAuthentication();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  bool _isProtectionEnabled = false;

  // ignore: unnecessary_getters_setters
  bool get isProtectionEnabled => _isProtectionEnabled;
  // ignore: unnecessary_getters_setters
  set isProtectionEnabled(bool enabled) => _isProtectionEnabled = enabled;

  bool isAuthenticated = false;

  Future<void> authenticate() async {
    if (_isProtectionEnabled) {
      try {
        isAuthenticated = await _auth.authenticateWithBiometrics(
          localizedReason: 'authenticate to access',
          useErrorDialogs: true,
          stickyAuth: true,
        );
        print('Done');
      } on PlatformException catch (e) {
        print(e);
      }

      isAuthenticated
          ? print('User is authenticated!')
          : print('User is not authenticated.');

      if (isAuthenticated) {
        _navigationService.navigateTo(HomeViewRoute);

        await _dialogService.showDialog(
          title: 'Login Success',
          description: 'You are now a verified user',
        );
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    }
  }
}
