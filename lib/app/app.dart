import 'package:coffee_order_app/ui/views/login/login_view.dart';
import 'package:coffee_order_app/ui/views/main/main_view.dart';
import 'package:coffee_order_app/ui/views/on_boarding/on_boarding_view.dart';
import 'package:coffee_order_app/ui/views/startup/startup_view.dart';
import 'package:coffee_order_app/ui/views/welcome/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coffee_order_app/ui/views/product/product_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnBoardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: ProductView),
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
