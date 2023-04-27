import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/app_dimens.dart';
import '../common/app_images.dart';

class KAppBar extends StatelessWidget {
  const KAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                AppImages.iconMenu,
                width: AppDimens.iconNav,
              ),
            ),
          ),
          Image.asset(
            AppImages.logo,
            height: 43.0,
          ),
          InkWell(
            onTap: () {},
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                AppImages.iconSetting,
                width: AppDimens.iconNav,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
