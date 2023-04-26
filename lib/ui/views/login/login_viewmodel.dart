import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool obscure = true;

  void obscurePassword() {
    obscure = !obscure;
    notifyListeners();
  }

  void showWelcome() =>
      _navigationService.clearStackAndShow(Routes.welcomeView);
}
