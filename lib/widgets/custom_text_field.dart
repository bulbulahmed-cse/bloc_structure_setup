
import 'package:bloc_structure_setup/core/theme/test_style.dart';
import 'package:bloc_structure_setup/widgets/widget_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.label,
    this.backgroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLine = 1,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.hint,
    this.enable = true,
    this.onTap,
    this.isRequired = false,
    this.borderRadius,
    this.textAlign = TextAlign.left,
    this.autofocus = false,
    this.contentPadding,
    this.borderColor,
    this.enableValidation = true,
    this.inputFormatters,
    this.validator,
    this.isLabelUpperCase = false,
    this.labelPadding,
    this.labelStyle,
    this.hintText,
    this.typeMsg,
    this.isBorder = true,
    this.hintStyle,
    this.style,
    this.helpText,
    this.helpTextStyle,
    this.onChanged,
    this.withTitle,
    this.titleText,
    this.titlePadding,
    this.titleStyle,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? label;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLine;
  final TextInputType textInputType;
  final bool obscureText;
  final String? hint;
  final bool enable;
  final GestureTapCallback? onTap;
  final bool isRequired;
  final double? borderRadius;
  final TextAlign textAlign;
  final bool autofocus;
  final EdgeInsets? contentPadding;
  final Color? borderColor;
  final bool enableValidation;
  final List<TextInputFormatter>? inputFormatters;
  final Function? validator;
  final bool isLabelUpperCase;
  final EdgeInsetsGeometry? labelPadding;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? helpTextStyle;
  final String? helpText;
  final TextStyle? style;
  final String? hintText;
  final String? typeMsg;
  final bool? isBorder;
  final bool? withTitle;
  final String? titleText;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleStyle;
  final Function(dynamic value)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final ValueNotifier<bool> suffixVisibility = ValueNotifier(false);

  @override
  void initState() {
    suffixVisibility.value = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetValidation(
      validator: widget.validator ??
          () {
            if (widget.controller.text.isEmpty) {
              return widget.hintText != null
                  ? '${widget.hintText} is required'
                  :  widget.hintText != null?'${widget.label} is required':'${widget.titleText} is required';
            } else {
              return null;
            }
          },
      margin: EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.withTitle == true)
            Padding(
              padding: widget.titlePadding ?? EdgeInsets.only(bottom: 8.h),
              child: Text(
                widget.titleText ?? '',
                style: widget.titleStyle ?? bodyTextStyleCG(),
                maxLines: 1,
              ),
            ),
          ValueListenableBuilder<bool>(
            valueListenable: suffixVisibility,
            builder: (context, value, child) {
              return TextFormField(
                onChanged: widget.onChanged,
                enabled: widget.enable,
                onTap: widget.onTap,
                controller: widget.controller,
                maxLines: widget.maxLine,
                keyboardType: widget.textInputType,
                style: widget.style??bodyTextStyle(),
                autocorrect: false,
                enableSuggestions: false,
                obscuringCharacter: '●',
                obscureText: value,
                autofocus: widget.autofocus,
                textAlign: widget.textAlign,
                inputFormatters: widget.inputFormatters,
                minLines: widget.maxLine,

                //obscuringCharacter: '*',

                decoration: InputDecoration(
                  fillColor: widget.backgroundColor ?? AppColors.white,
                  contentPadding: widget.contentPadding,
                  hintText: widget.typeMsg??(widget.hintText!=null?"${widget.hintText?.toLowerCase()}":''),
                  labelStyle: widget.labelStyle,
                  hintStyle: widget.hintStyle,
                  helperText: widget.helpText,
                  helperStyle: widget.helpTextStyle??smallTextStyle(),
                  labelText: widget.isRequired==false?widget.label:"${widget.label} *",
                  prefixIcon: widget.prefixIcon,
                  border: widget.isBorder == true ? null: InputBorder.none,
                  enabledBorder: widget.isBorder == true ? null: InputBorder.none,
                  focusedBorder: widget.isBorder == true ? null: InputBorder.none,
                  errorBorder: widget.isBorder == true ? null: InputBorder.none,
                  disabledBorder: widget.isBorder == true ? null: InputBorder.none,
                  suffixIcon: widget.suffixIcon ??
                      ((widget.obscureText==true)?Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: InkWell(
                            onTap: () => suffixVisibility.value = !suffixVisibility.value,
                            borderRadius: BorderRadius.circular(30.r),
                            child: Icon(
                              value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: AppColors.hintColor,
                            )),
                      ):null),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
