import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/ui_helpers.dart';
import '../../common/app_animations.dart';
import '../../common/app_colors.dart';
import '../../common/app_dimens.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../../common/app_styles.dart';
import '../../widgets/button.dart';
import 'welcome_viewmodel.dart';

class WelcomeView extends StackedView<WelcomeViewModel> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WelcomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
              child: Center(
                child: Lottie.asset(
                  AppAnimations.welcome,
                  width: screenWidth(context),
                  fit: BoxFit.fill,
                  repeat: false,
                ),
              ),
            ),
            verticalSpace(62.0),
            Text(
              AppStrings.labelWelcome,
              style: blackBoldTextStyle.copyWith(
                fontSize: 26.0,
              ),
            ),
            verticalSpace(15.0),
            Text(
              AppStrings.messageWelcome,
              style: blackRegularTextStyle.copyWith(
                fontSize: AppDimens.bodySmall,
                color: AppColors.black.withOpacity(
                  0.4,
                ),
              ),
            ),
            verticalSpace(60.0),
            Button(
              onPressed: () {},
              loadingColor: Colors.white,
              borderRadius: BorderRadius.circular(61.0),
              color: AppColors.primary,
              child: Center(
                child: Text(
                  AppStrings.actionOrder,
                  style: whiteRegularTextStyle.copyWith(
                    fontSize: AppDimens.body,
                  ),
                ),
              ),
            ),
            verticalSpace(72.0),
          ],
        ),
      ),
    );
  }

  @override
  WelcomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomeViewModel();
}
