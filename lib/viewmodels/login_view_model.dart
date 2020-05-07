import 'package:fiverr_test/constants/route_names.dart';
import 'package:fiverr_test/locator.dart';
import 'package:fiverr_test/services/api_services.dart';
import 'package:fiverr_test/services/dialog_service.dart';
import 'package:fiverr_test/services/navigation_service.dart';
import 'package:fiverr_test/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends BaseModel {
  final ApiServices _apiServices = locator<ApiServices>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _apiServices.login(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateToReplace(HomeViewRoute);

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
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }
}
