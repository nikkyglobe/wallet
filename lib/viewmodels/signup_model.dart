import 'package:fiverr_test/constants/route_names.dart';
import 'package:fiverr_test/locator.dart';
import 'package:fiverr_test/services/api_services.dart';
import 'package:fiverr_test/services/dialog_service.dart';
import 'package:fiverr_test/services/navigation_service.dart';
import 'package:fiverr_test/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class SignUpViewModel extends BaseModel {
  final ApiServices _apiServices = locator<ApiServices>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    @required String fullName,
    @required String email,
    @required String password,
    // @required String confirmPassword,
    @required String phone,
  }) async {
    setBusy(true);

    var result = await _apiServices.signUp(
        fullName: fullName,
        email: email,
        password: password,
        // confirmPassword: confirmPassword,
        phone: phone);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(LoginViewRoute);
        await _dialogService.showDialog(
          title: 'Sign Up Success',
          description:
              'Registration successful, check your mail for a verification link to complete the Registration process',
        );

        // _navigationService.navigateTo(HomeViewRoute);

      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
