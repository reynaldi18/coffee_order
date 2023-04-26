import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/app_colors.dart';
import '../common/app_dimens.dart';
import '../common/app_styles.dart';
import '../../helpers/ui_helpers.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    this.obscure = false,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.placeholder,
    this.maxLines,
    this.minLines = 1,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.error = false,
    this.controller,
    this.borderColor = Colors.transparent,
    this.borderRadius = 6.0,
    this.backgroundColor = Colors.white,
    this.padding,
    this.placeholderStyle,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.isDense = false,
    this.autofocus = false,
    this.elevation = 0.0,
    this.enabled = true,
    this.maxLength,
    this.onTap,
    this.isOption = false,
    this.textAlign,
  }) : super(key: key);

  final bool enabled;
  final ValueChanged<String>? onChanged;
  final bool obscure;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? placeholder;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final TextInputType keyboardType;
  final String? errorText;
  final bool error;
  final TextEditingController? controller;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final TextStyle? placeholderStyle;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final bool isDense;
  final double elevation;
  final VoidCallback? onTap;
  final bool isOption;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label ?? '',
                style: whiteSemiBoldTextStyle.copyWith(
                  fontSize: AppDimens.bodySmall,
                ),
              )
            : Container(),
        label != null ? verticalSpace(4.0) : Container(),
        Material(
          elevation: elevation,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Theme(
            data: ThemeData(primaryColor: AppColors.primary),
            child: TextFormField(
              readOnly: isOption,
              enabled: enabled,
              showCursor: !isOption,
              enableInteractiveSelection: !isOption,
              onFieldSubmitted: onFieldSubmitted,
              textInputAction: textInputAction,
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              style: const TextStyle(fontSize: AppDimens.textHint),
              obscureText: obscure,
              textAlignVertical: TextAlignVertical.center,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              validator: validator,
              inputFormatters: inputFormatters,
              autofocus: autofocus,
              onTap: () {
                if (onTap != null) onTap!();
              },
              decoration: InputDecoration(
                isDense: isDense,
                errorStyle: const TextStyle(
                  fontSize: AppDimens.textHint,
                ),
                hintText: placeholder,
                hintStyle: placeholderStyle ??
                    const TextStyle(
                      color: AppColors.grey,
                      fontSize: AppDimens.textHint,
                    ),
                filled: true,
                fillColor:
                    enabled ? backgroundColor : AppColors.disableTextField,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: prefixIcon,
                ),
                suffixIcon: suffixIcon,
                suffix: suffixText != null
                    ? Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          suffixText ?? '',
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    : null,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0.0,
                  maxHeight: 25.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary.withOpacity(0.35),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
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
