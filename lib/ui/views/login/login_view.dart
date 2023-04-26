import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../helpers/ui_helpers.dart';
import '../../../helpers/validator/validator.dart';
import '../../common/app_animations.dart';
import '../../common/app_colors.dart';
import '../../common/app_dimens.dart';
import '../../common/app_images.dart';
import '../../common/app_strings.dart';
import '../../common/app_styles.dart';
import '../../widgets/button.dart';
import '../../widgets/textfield.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
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
            verticalSpace(63.0),
            Expanded(
              child: Center(
                child: Lottie.asset(
                  AppAnimations.login,
                  width: 260.0,
                  fit: BoxFit.fill,
                  repeat: false,
                ),
              ),
            ),
            verticalSpace(41.0),
            Text(
              AppStrings.labelLogin,
              style: blackBoldTextStyle.copyWith(
                fontSize: 26.0,
              ),
            ),
            verticalSpace(15.0),
            Text(
              AppStrings.messageLogin,
              style: blackRegularTextStyle.copyWith(
                fontSize: AppDimens.bodySmall,
                color: AppColors.black.withOpacity(
                  0.4,
                ),
              ),
            ),
            verticalSpace(34.0),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  KTextField(
                    isDense: true,
                    maxLines: 1,
                    borderRadius: AppDimens.radiusField,
                    controller: emailController,
                    borderColor: AppColors.field,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    backgroundColor: AppColors.field,
                    placeholder: AppStrings.hintEmail,
                    placeholderStyle: blackRegularTextStyle.copyWith(
                      fontSize: AppDimens.bodySmall,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                    validator: Validator.emailValidator,
                  ),
                  verticalSpace(15.0),
                  KTextField(
                    isDense: true,
                    maxLines: 1,
                    borderRadius: AppDimens.radiusField,
                    controller: passwordController,
                    borderColor: AppColors.field,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    backgroundColor: AppColors.field,
                    placeholder: AppStrings.hintPassword,
                    placeholderStyle: blackRegularTextStyle.copyWith(
                      fontSize: AppDimens.bodySmall,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => viewModel.obscurePassword(),
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (
                          Widget child,
                          Animation<double> animation,
                        ) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: Icon(
                          viewModel.obscure
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          key: ValueKey<bool>(viewModel.obscure),
                          size: 18.0,
                          color: viewModel.obscure
                              ? AppColors.black.withOpacity(0.4)
                              : Colors.black,
                        ),
                      ),
                    ),
                    obscure: viewModel.obscure,
                    validator: Validator.passwordValidator,
                  ),
                ],
              ),
            ),
            verticalSpace(10.0),
            Row(
              children: [
                const Spacer(),
                Text(
                  AppStrings.labelForgotPassword,
                  style: blackRegularTextStyle.copyWith(
                    fontSize: AppDimens.caption,
                  ),
                ),
              ],
            ),
            verticalSpace(45.0),
            Button(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  viewModel.showWelcome();
                }
              },
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
            verticalSpace(72.0),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
