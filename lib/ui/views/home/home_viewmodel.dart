import 'package:coffee_order_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/category.dart';
import '../../../models/product.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<Product> products = [];
  List<Category> categories = listCategory;
  int categoryId = 1;

  Future runStartupLogic() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    setProductData();
  }

  void setProductData() {
    products = listProduct;
    if (categoryId != 1) {
      products = products
          .where((product) => product.categoryId == categoryId)
          .toList();
    } else {
      products = listProduct;
    }
    notifyListeners();
    setBusy(false);
  }

  Future<void> setCategory(int id) async {
    for (var element in categories) {
      element.isSelected = false;
    }
    categoryId = id;
    setProductData();
    notifyListeners();
  }

  void showProduct(Product data) =>
      _navigationService.navigateToProductView(product: data);
}
