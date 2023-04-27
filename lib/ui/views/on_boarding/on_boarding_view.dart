import 'package:coffee_order_app/ui/common/app_animations.dart';
import 'package:coffee_order_app/ui/common/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/app_colors.dart';
import '../../common/app_dimens.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../../../helpers/ui_helpers.dart';
import '../../widgets/button.dart';
import 'on_boarding_viewmodel.dart';

class OnBoardingView extends StackedView<OnBoardingViewModel> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnBoardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(75.0),
            Center(
              child: Image.asset(
                AppImages.logo,
                width: 60.0,
              ),
            ),
            verticalSpace(48.0),
            Expanded(
              child: SizedBox(
                height: 368,
                width: screenWidth(context),
                child: Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        AppImages.onBoardingIllustration,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Lottie.asset(
                        AppAnimations.onBoarding,
                        width: 130.0,
                        height: 108.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(62.0),
            Text(
              AppStrings.labelIntro,
              style: blackBoldTextStyle.copyWith(
                fontSize: 26.0,
              ),
            ),
            verticalSpace(15.0),
            Text(
              AppStrings.messageIntro,
              style: blackRegularTextStyle.copyWith(
                fontSize: AppDimens.bodySmall,
                color: AppColors.black.withOpacity(
                  0.4,
                ),
              ),
            ),
            verticalSpace(60.0),
            Row(
              children: [
                Expanded(
                  child: Button(
                    onPressed: () {},
                    loadingColor: Colors.white,
                    borderRadius: BorderRadius.circular(61.0),
                    color: AppColors.greySoft,
                    child: Center(
                      child: Text(
                        AppStrings.actionSignUp,
                        style: blackRegularTextStyle.copyWith(
                          fontSize: AppDimens.body,
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(14.0),
                Expanded(
                  child: Button(
                    onPressed: () => viewModel.showLogin(),
                    loadingColor: Colors.white,
                    borderRadius: BorderRadius.circular(61.0),
                    color: AppColors.primary,
                    child: Center(
                      child: Text(
                        AppStrings.actionLogin,
                        style: whiteRegularTextStyle.copyWith(
                          fontSize: AppDimens.body,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(72.0),
          ],
        ),
      ),
    );
  }

  @override
  OnBoardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnBoardingViewModel();
}
