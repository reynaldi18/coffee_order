import 'package:stacked/stacked.dart';

import '../../../models/category.dart';
import '../../../models/product.dart';

class HomeViewModel extends BaseViewModel {
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

  Future<void> setCategory(Category data) async {
    for (var element in categories) {
      element.isSelected = false;
    }
    categoryId = data.id;
    setProductData();
    notifyListeners();
  }
}
