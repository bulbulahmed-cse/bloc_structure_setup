import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CustomCheckbox extends FormField<bool> {
  CustomCheckbox(
      {super.key,
      Widget? title,
      super.onSaved,
      super.validator,
      bool super.initialValue = false,
      bool? value,
      Function(bool)? onChanged,
      bool autoValidate = false})
      : super(
          builder: (FormFieldState<bool> state) {
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              dense: state.hasError,
              title: title,
              value: value ?? state.value,
              fillColor: WidgetStateProperty.all(
                  state.value == true || value == true ? AppColors.primary : Colors.transparent),
              onChanged: (value) => (onChanged != null) ? onChanged(value ?? false) : state.didChange(value),
              subtitle: state.hasError
                  ? Builder(
                      builder: (BuildContext context) => Text(
                        state.errorText ?? "",
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                    )
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        );
}
