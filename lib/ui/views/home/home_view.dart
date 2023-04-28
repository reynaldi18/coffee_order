import 'package:coffee_order_app/ui/common/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/app_dimens.dart';
import '../../common/app_strings.dart';
import '../../widgets/item_product.dart';
import '../../widgets/shimmer_item_product.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              AppStrings.labelHome,
              style: blackBoldTextStyle.copyWith(
                fontSize: AppDimens.textXXL,
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.categories.length,
                itemBuilder: (context, index) {
                  var item = viewModel.categories[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 32.0 : 0.0,
                      right: 14.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        viewModel.setCategory(item.id);
                        item.isSelected = true;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: item.isSelected
                              ? AppColors.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 8.0,
                          ),
                          child: Center(
                            child: Text(
                              item.title,
                              style: whiteRegularTextStyle.copyWith(
                                  fontSize: AppDimens.bodySmall,
                                  color: item.isSelected
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.53)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => viewModel.runStartupLogic(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24.0,
                ),
                child: viewModel.isBusy
                    ? const ShimmerItemProduct()
                    : GridView.custom(
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 4,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 14,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: const [
                            QuiltedGridTile(3, 2),
                            QuiltedGridTile(2, 2),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: viewModel.products.length,
                          (context, index) {
                            final product = viewModel.products[index];
                            return GestureDetector(
                              onTap: () => viewModel.showProduct(product),
                              child: ItemProduct(product: product),
                            );
                          },
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
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
