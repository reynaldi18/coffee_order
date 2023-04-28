import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/ui_helpers.dart';
import '../../models/product.dart';
import '../common/app_colors.dart';
import '../common/app_dimens.dart';
import '../common/app_images.dart';
import '../common/app_styles.dart';
import 'shimmer_basic.dart';

class ItemProduct extends StatefulWidget {
  final Product product;

  const ItemProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22.0),
                child: Hero(
                  tag: widget.product.id,
                  child: Image.network(
                    widget.product.image,
                    width: screenWidth(context),
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
            ),
            verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: AppDimens.bodySmall,
                  ),
                ),
                Text(
                  '\$${widget.product.price}',
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: AppDimens.bodySmall,
                  ),
                ),
              ],
            ),
            verticalSpace(8.0),
            Text(
              widget.product.desc,
              style: blackRegularTextStyle.copyWith(
                fontSize: AppDimens.caption,
                color: Colors.black.withOpacity(0.6),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Positioned(
          top: 10,
          left: 10,
          child: InkWell(
            onTap: () {
              setState(() {
                widget.product.isFavorite = !widget.product.isFavorite;
              });
            },
            child: Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(0.46),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                    widget.product.isFavorite
                        ? AppImages.iconHeart
                        : AppImages.iconHeartBorder,
                    key: ValueKey<bool>(widget.product.isFavorite),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
