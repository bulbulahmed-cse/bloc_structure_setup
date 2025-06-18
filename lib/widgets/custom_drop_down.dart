/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lynx/core/theme/app_colors.dart';

import '../di/setup_locator.dart';
import '../main_bloc.dart';

class CustomDropDown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final DropdownButtonBuilder? selectedItemBuilder;
  final T? value;
  final void Function(T?)? onChanged;
  final TextStyle? style;
  final Color? dropdownColor;
  final Color? fillColor;
  final bool isBorderVisible;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;
  final String? label;
  final Color? labelColor;
  final TextStyle? hintStyle;
  final String? hint;
  final Color? hintColor;
  final String? Function(T?)? validator;

  const CustomDropDown({
    super.key,
    this.items,
    this.selectedItemBuilder,
    this.value,
    this.onChanged,
    this.style,
    this.dropdownColor,
    this.contentPadding,
    this.fillColor,
    this.isBorderVisible = true,
    this.labelStyle,
    this.label,
    this.labelColor,
    this.hintStyle,
    this.hint,
    this.hintColor,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            children: [
              Text(label ?? "",
                  style: labelStyle ??
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color:
                              labelColor ?? (sl<MainBloc>().state.isDark == true ? AppColors.grey : AppColors.black))),
              10.verticalSpace,
            ],
          ),
        Container(
          padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: fillColor ?? (sl<MainBloc>().state.isDark == true ? AppColors.black : AppColors.white),
            borderRadius: BorderRadius.circular(10.r),
            border: isBorderVisible
                ? Border.all(
                    color: sl<MainBloc>().state.isDark == true ? AppColors.black : AppColors.black,
                  )
                : null,
          ),
          child: InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).unfocus();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: sl<MainBloc>().state.isDark == true ? AppColors.black : AppColors.white,
                  content: Container(
                      height: 200.h,
                      width: double.infinity,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: items!.length,
                        separatorBuilder: (context, index) => Divider(
                          color: sl<MainBloc>().state.isDark == true ? AppColors.grey : AppColors.grey,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
                            onTap: () {
                              onChanged!(items![index].value);
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Text(
                                items![index].child!.toString(),
                                style: style ??
                                    Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: sl<MainBloc>().state.isDark == true ? AppColors.grey : AppColors.black),
                              ),
                            ),
                          );
                        },
                      )),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  value != null ? "" : hint ?? "",
                  style: hintStyle ??
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: hintColor ?? (sl<MainBloc>().state.isDark == true ? AppColors.grey : AppColors.black)),
                ),
                Spacer(),
                Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
              ],
            ),
          ),
        )
      ],
    );
  }
}
*/

import 'package:bloc_structure_setup/core/theme/test_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/app_colors.dart';

class CustomDropdown<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final T? value;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(dynamic) onChange;

  /// list of DropdownItems
  final List<DropdownItem<T>>? items;

  /// alignment of the dropdown button
  final Alignment alignment;

  final Color? fillColor;
  final Color? dropdownColor;
  final Color? borderColor;
  final Color? itemBackgroundColor;
  final Color? selectedColor;
  final double? elevation;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? filledPadding;
  final EdgeInsetsGeometry? dropdownItemPadding;
  final TextStyle? textStyle;
  final TextStyle? dropdownTextStyle;
  final TextStyle? hintTextStyle;
  final double? borderRadius;
  final double? borderRadiusDropDown;

  /// dropdown button icon defaults to caret
  final Icon? icon;
  final bool hideIcon;

  ///hint text for the dropdown
  final String? hintText;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;

  final Offset? offset;
  final TextStyle? labelStyle;
  final String? label;
  final Color? labelColor;
  final String? Function(Object?)? validator;

  final bool? isBorderVisible;
  final bool? isExpanded;
  final int? offsetAdjustmentValue;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomDropdown({
    super.key,
    this.hideIcon = false,
    required this.items,
    this.icon,
    this.leadingIcon = false,
    required this.onChange,
    this.hintText,
    this.value,
    this.alignment = Alignment.centerLeft,
    this.fillColor,
    this.borderColor,
    this.selectedColor,
    this.elevation,
    this.width,
    this.height,
    this.filledPadding,
    this.dropdownItemPadding,
    this.textStyle,
    this.dropdownTextStyle,
    this.hintTextStyle,
    this.borderRadius,
    this.offset,
    this.dropdownColor,
    this.label,
    this.labelStyle,
    this.labelColor,
    this.itemBackgroundColor,
    this.validator,
    this.isBorderVisible = true,
    this.borderRadiusDropDown,
    this.offsetAdjustmentValue,
    this.isExpanded,
    this.mainAxisAlignment,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0);
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _rotateAnimation = Tween(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    // link the overlay to the button
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Column(children: [Text(widget.label ?? "", style: widget.labelStyle ?? bodyTextStyle()), 10.verticalSpace]),
        FormField<T>(
          validator: widget.validator,
          initialValue: widget.value,
          builder: (formFieldState) {
            return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => _toggleDropdown(formFieldState: formFieldState),
                      child: CompositedTransformTarget(
                        link: _layerLink,
                        child: Container(
                          width: widget.width ?? double.infinity,
                          height: widget.height,
                          padding: widget.filledPadding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                          decoration: BoxDecoration(
                            color: widget.fillColor ?? AppColors.cardColorLight,
                            border:
                                widget.isBorderVisible == false
                                    ? null
                                    : Border.all(
                                      color:
                                          (formFieldState.hasError == true
                                              ? AppColors.error
                                              : AppColors.cardBorderColorLight),
                                      width: 1,
                                    ),
                            borderRadius: BorderRadius.circular((widget.borderRadius ?? 10).r),
                          ),
                          child: Row(
                            mainAxisAlignment: widget.mainAxisAlignment??MainAxisAlignment.start,
                            textDirection: widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _getWidget(widget),
                              if (!widget.hideIcon)
                                RotationTransition(
                                  turns: _rotateAnimation,
                                  child:
                                      widget.icon ??
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5, right: 7),
                                        child: RotatedBox(
                                          quarterTurns: 3,
                                          child: Icon(Icons.arrow_back_ios_rounded, size: 13, color: Colors.grey),
                                        ),
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (formFieldState.hasError)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: widget.filledPadding?.horizontal ?? 16.w),
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          formFieldState.errorText!,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.error, height: 0.5),
                        ),
                      ),
                  ],
                );
          },
        ),
      ],
    );
  }

  OverlayEntry _createOverlayEntry({required FormFieldState<T> formFieldState}) {
    // find the size and position of the current widget
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder:
          (context) => GestureDetector(
            onTap: () => _toggleDropdown(close: true, formFieldState: formFieldState),
            behavior: HitTestBehavior.translucent,
            // full screen container to register taps anywhere and close drop down
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    left: offset.dx,
                    top: topOffset,
                    width: size.width,
                    child: CompositedTransformFollower(
                      offset: widget.offset ?? Offset(0, size.height - (widget.offsetAdjustmentValue ?? 22)),
                      link: _layerLink,
                      showWhenUnlinked: false,
                      child: Material(
                        elevation: widget.elevation ?? 5,
                        color: widget.dropdownColor ?? Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((widget.borderRadiusDropDown ?? 10).r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: SizeTransition(
                          axisAlignment: 1,
                          sizeFactor: _expandAnimation,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  (MediaQuery.of(context).size.height - topOffset - 15).isNegative
                                      ? 100
                                      : MediaQuery.of(context).size.height - topOffset - 15,
                            ),
                            child: RawScrollbar(
                              thumbVisibility: true,
                              thumbColor: Colors.grey,
                              controller: _scrollController,
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemCount: widget.items?.length ?? 0,
                                separatorBuilder:
                                    (context, index) => const Divider(color: Colors.transparent, height: 1),
                                itemBuilder: (context, index) {
                                  T? value = widget.items?[index].value;
                                  return InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        _currentIndex = index;
                                        widget.onChange(value);
                                        formFieldState.didChange(value);
                                      });
                                      _toggleDropdown(formFieldState: formFieldState);
                                    },
                                    child: Container(
                                      padding:
                                          widget.dropdownItemPadding ??
                                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                      alignment: widget.alignment,
                                      color: (widget.itemBackgroundColor ?? Theme.of(context).cardColor),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Align(alignment: widget.alignment, child: widget.items![index]),
                                          ),
                                          if (widget.items?[index].value == widget.value)
                                            Icon(Icons.check, color: AppColors.primary, size: 20.r),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _getWidget(CustomDropdown<T> widget) {
    if (widget.isExpanded == false) {
      return widget.value == null
          ? Text("Select a Option")
          : widget.items?.firstWhere((element) => element.value == widget.value) as Widget;
    } else {
      return widget.value == null
          ? Expanded(
            child: Text(widget.hintText ?? "Select an option", style: widget.hintTextStyle ?? bodyTextStyleCG()),
          )
          : Expanded(
            child: Align(
              alignment: widget.alignment,
              child: widget.items?.firstWhere((element) => element.value == widget.value),
            ),
          );
    }
  }

  void _toggleDropdown({bool close = false, required FormFieldState<T> formFieldState}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry(formFieldState: formFieldState);
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.
class DropdownItem<T> extends StatelessWidget {
  final T? value;
  final Widget child;

  const DropdownItem({super.key, this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
