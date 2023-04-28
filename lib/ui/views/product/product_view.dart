import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/ui_helpers.dart';
import '../../../models/product.dart';
import '../../common/app_colors.dart';
import '../../common/app_dimens.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../../common/app_styles.dart';
import '../../widgets/button.dart';
import '../../widgets/item_size.dart';
import '../../widgets/shimmer_basic.dart';
import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  final Product product;

  const ProductView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: Stack(
        children: [
          SafeArea(
            top: false,
            child: Hero(
              tag: viewModel.product.id,
              child: Image.network(
                viewModel.product.image,
                width: screenWidth(context),
                height: screenHeightPercentage(
                  context,
                  percentage: 0.66,
                ),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return ShimmerBasic(
                    height: screenHeight(context),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  width: screenWidth(context),
                  color: AppColors.primary.withOpacity(0.15),
                  child: const Icon(
                    Icons.error,
                    size: 24.0,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => viewModel.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () => viewModel.setFavorite(),
                    child: Container(
                      height: 36.0,
                      width: 36.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Colors.white.withOpacity(0.46),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: SvgPicture.asset(
                            viewModel.product.isFavorite
                                ? AppImages.iconHeart
                                : AppImages.iconHeartBorder,
                            key: ValueKey<bool>(viewModel.product.isFavorite),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeightPercentage(context, percentage: 0.42),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38.0),
                      topRight: Radius.circular(38.0),
                    ),
                    color: AppColors.whiteBackground),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(37.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            viewModel.product.name,
                            style: blackBoldTextStyle.copyWith(
                              fontSize: AppDimens.textXXL,
                            ),
                          ),
                          Text(
                            '\$${viewModel.productPrice.toStringAsFixed(2)}',
                            style: primaryBoldTextStyle.copyWith(
                              fontSize: AppDimens.subHeadline,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(10.0),
                      Expanded(
                        child: Text(
                          viewModel.product.desc,
                          style: blackRegularTextStyle.copyWith(
                            fontSize: AppDimens.bodySmall,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                      verticalSpace(30.0),
                      Text(
                        AppStrings.labelSelectSize,
                        style: blackBoldTextStyle.copyWith(
                          fontSize: AppDimens.body,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 22.0,
                          bottom: 50.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ItemSize(
                              size: viewModel.sizes[0],
                              onTap: () => viewModel.selectSize(
                                viewModel.sizes[0],
                              ),
                            ),
                            ItemSize(
                              size: viewModel.sizes[1],
                              onTap: () => viewModel.selectSize(
                                viewModel.sizes[1],
                              ),
                            ),
                            ItemSize(
                              size: viewModel.sizes[2],
                              onTap: () => viewModel.selectSize(
                                viewModel.sizes[2],
                              ),
                            ),
                            ItemSize(
                              size: viewModel.sizes[3],
                              onTap: () => viewModel.selectSize(
                                viewModel.sizes[3],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => viewModel.removeQuantity(),
                                child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.7,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 68.0,
                                child: Center(
                                  child: Text(
                                    '${viewModel.quantity}',
                                    style: blackRegularTextStyle.copyWith(
                                      fontSize: AppDimens.headline,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => viewModel.addQuantity(),
                                child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.7,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          horizontalSpace(46.0),
                          Expanded(
                            child: Button(
                              onPressed: () {},
                              loadingColor: Colors.white,
                              borderRadius: BorderRadius.circular(61.0),
                              color: AppColors.primary,
                              child: Center(
                                child: Text(
                                  AppStrings.actionAddToCart,
                                  style: whiteBoldTextStyle.copyWith(
                                    fontSize: AppDimens.body,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel(product: product);

  @override
  void onViewModelReady(ProductViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
