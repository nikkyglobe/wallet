import 'package:fiverr_test/services/api_services.dart';
import 'package:fiverr_test/services/dialog_service.dart';
import 'package:fiverr_test/services/local_auth_services.dart';
import 'package:fiverr_test/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => ApiServices());
  locator.registerLazySingleton(() => LocalAuthenticationService());
}
