import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:animations/animations.dart';

import '../../common/app_colors.dart';
import '../../common/app_dimens.dart';
import '../../common/app_images.dart';
import '../../widgets/appbar.dart';
import '../blank_view.dart';
import '../home/home_view.dart';
import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        centerTitle: true,
        elevation: 0,
        titleSpacing: 0,
        title: const KAppBar(),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: viewModel.reverse,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: getViewForIndex(viewModel.currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.whiteBackground,
        currentIndex: viewModel.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: viewModel.setIndex,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppImages.iconHome,
              width: AppDimens.iconNav,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconHome,
              width: AppDimens.iconNav,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppImages.iconInbox,
              width: AppDimens.iconNav,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconInbox,
              width: AppDimens.iconNav,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppImages.iconCart,
              width: AppDimens.iconNav,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconCart,
              width: AppDimens.iconNav,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppImages.iconLocation,
              width: AppDimens.iconNav,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconLocation,
              width: AppDimens.iconNav,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              AppImages.iconUser,
              width: AppDimens.iconNav,
            ),
            activeIcon: SvgPicture.asset(
              AppImages.iconUser,
              width: AppDimens.iconNav,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const BlankView();
      case 2:
        return const BlankView();
      case 3:
        return const BlankView();
      case 4:
        return const BlankView();
      default:
        return const HomeView();
    }
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}
