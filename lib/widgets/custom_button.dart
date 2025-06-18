import 'package:bloc_structure_setup/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../core/theme/app_colors.dart';

class CustomButton extends StatefulWidget {
  final bool? isLoading;
  final bool enable;
  final String text;
  final Color? color;
  final Color? broderColor;
  final Color? textColor;
  final Function()? onPressed;
  final Size? minimumSize;
  final bool? maxWidth;
  final bool? minWidth;
  final TextStyle? textStyle;
  final bool? onlyBorder;
  final EdgeInsetsGeometry? buttonPadding;
  final OutlinedBorder? shape;
  final Widget? child;
  final bool? isSecondary;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton({
    super.key,
    this.isLoading = false,
    required this.text,
    this.enable = true,
    this.onPressed,
    this.color,
    this.textColor,
    this.minimumSize,
    this.textStyle,
    this.broderColor,
    this.maxWidth,
    this.minWidth,
    this.buttonPadding,
    this.onlyBorder,
    this.shape,
    this.child,
    this.isSecondary,
    this.borderRadius,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final ValueNotifier<bool> _onPressedCalled = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: ValueListenableBuilder(
        valueListenable: _onPressedCalled,
        builder: (_, value, child) {
          return widget.isLoading ?? false
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: widget.enable
                      ? () async {
                          if (widget.onPressed != null && (_onPressedCalled.value == false)) {
                            widget.onPressed!();
                            _onPressedCalled.value = true;
                            Future.delayed(Duration(seconds: 3), () {}).then((v) {
                              _onPressedCalled.value = false;
                            });
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shadowColor: AppColors.primary.withOpacityFraction(.5),
                    elevation: 0,
                    backgroundColor: widget.enable
                        ? (widget.color ??
                            (widget.onlyBorder ?? false
                                ? Colors.transparent
                                : widget.isSecondary ?? false
                                    ? AppColors.primary50P
                                    : AppColors.primary))
                        : AppColors.primary.withOpacityFraction(0.08),
                    disabledBackgroundColor: !widget.enable ? AppColors.primary.withOpacityFraction(0.08) : AppColors.disable,
                    side: widget.onlyBorder ?? false
                        ? BorderSide(color: widget.broderColor ?? AppColors.primary, width: 1)
                        : BorderSide.none,
                    shape: widget.shape ??
                        RoundedRectangleBorder(
                          borderRadius: widget.borderRadius ?? BorderRadius.circular(50.r),
                        ),
                    fixedSize: widget.maxWidth ?? true
                        ? Size(1.sw, double.infinity)
                        : widget.minimumSize ?? const Size(double.infinity, double.infinity),
                  ),
                  child: Padding(
                    padding: widget.buttonPadding ?? EdgeInsets.symmetric(vertical: 14.r),
                    child: child ??
                        Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          style: widget.textStyle ??
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: widget.textColor ??
                                        (widget.onlyBorder ?? false
                                            ? Theme.of(context).textTheme.displaySmall?.color
                                            : widget.isSecondary ?? false
                                                ? Theme.of(context).textTheme.displaySmall?.color
                                                : AppColors.backgroundDark),
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                  ),
                );
        },
      ),
    );
  }
}
