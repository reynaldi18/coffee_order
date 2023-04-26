import 'package:coffee_order_app/ui/views/home/home_view.dart';
import 'package:coffee_order_app/ui/views/on_boarding/on_boarding_view.dart';
import 'package:coffee_order_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coffee_order_app/ui/views/login/login_view.dart';
import 'package:coffee_order_app/ui/views/welcome/welcome_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnBoardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: WelcomeView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
)
class App {}
