import 'package:coffee_order_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class OnBoardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void showLogin() => _navigationService.navigateToLoginView();
}
