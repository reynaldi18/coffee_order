import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/ui_helpers.dart';
import '../../models/size.dart';
import '../common/app_colors.dart';
import '../common/app_dimens.dart';
import '../common/app_styles.dart';

class ItemSize extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;

  const ItemSize({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            size.image,
            colorFilter: ColorFilter.mode(
              size.isSelected
                  ? AppColors.primary.withOpacity(0.6)
                  : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(10.0),
          Text(
            size.title,
            style: blackBoldTextStyle.copyWith(
              fontSize: AppDimens.body,
              color: size.isSelected ? AppColors.primary : AppColors.black,
            ),
          ),
          verticalSpace(6.0),
          Text(
            size.desc,
            style: blackRegularTextStyle.copyWith(
              fontSize: AppDimens.caption,
              fontWeight: FontWeight.w400,
              color: size.isSelected ? AppColors.primary : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
