import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../helpers/ui_helpers.dart';
import '../common/app_colors.dart';
import '../common/app_dimens.dart';

class ShimmerBasic extends StatelessWidget {
  final double height;
  final double? width;
  final double? radius;

  const ShimmerBasic({
    Key? key,
    required this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.baseColorShimmer,
      highlightColor: AppColors.highlightColorShimmer,
      child: Container(
        height: height,
        width: width ?? screenWidth(context),
        decoration: BoxDecoration(
          color: AppColors.baseColorShimmer,
          borderRadius: BorderRadius.circular(radius ?? AppDimens.radiusSmall),
        ),
      ),
    );
  }
}
