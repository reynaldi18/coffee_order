import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/product.dart';
import '../../../models/size.dart';

class ProductViewModel extends BaseViewModel {
  final Product product;

  ProductViewModel({required this.product});

  final _navigationService = locator<NavigationService>();

  List<Size> sizes = listSize;
  Size? sizeSelected;
  int quantity = 1;
  double productPrice = 0.0;

  Future runStartupLogic() async {
    await Future.delayed(const Duration(microseconds: 300));
    selectSize(sizes[0]);
  }

  void back() {
    _navigationService.back();
  }

  void selectSize(Size data) {
    for (var size in sizes) {
      if (data.id == size.id) {
        size.isSelected = true;
      } else {
        size.isSelected = false;
      }
    }
    sizeSelected = data;
    calculatePrice();
    notifyListeners();
  }

  void addQuantity() {
    quantity += 1;
    calculatePrice();
  }

  void removeQuantity() {
    quantity -= 1;
    calculatePrice();
  }

  void calculatePrice() {
    productPrice = product.price;
    switch (sizeSelected?.id) {
      case 1:
        productPrice = product.price * quantity;
        break;
      case 2:
        productPrice = (product.price + 0.5) * quantity;
        break;
      case 3:
        productPrice = (product.price + 1.0) * quantity;
        break;
      case 4:
        productPrice = (product.price + 1.5) * quantity;
        break;
    }
    notifyListeners();
  }

  void setFavorite() {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}
