import 'package:coffee_order_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../common/app_dimens.dart';
import 'shimmer_basic.dart';

class ShimmerItemProduct extends StatelessWidget {
  const ShimmerItemProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
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
        childCount: 8,
        (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22.0),
                  child: ShimmerBasic(
                    height: screenHeight(context),
                  ),
                ),
              ),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ShimmerBasic(
                    height: AppDimens.bodySmall,
                    width: 64.0,
                  ),
                  ShimmerBasic(
                    height: AppDimens.bodySmall,
                    width: 64.0,
                  ),
                ],
              ),
              verticalSpace(8.0),
              const ShimmerBasic(
                height: AppDimens.caption,
              ),
            ],
          );
        },
      ),
    );
  }
}
