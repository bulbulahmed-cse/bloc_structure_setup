import 'package:flutter/material.dart';
class WidgetValidation extends StatelessWidget {
  final Function validator;
  final Widget child;
  final EdgeInsetsGeometry? margin;

  const WidgetValidation({
    super.key,
    required this.validator,
    required this.child,
    this.margin,
  });


  @override
  Widget build(BuildContext context) {
    return FormField(
        validator: (value)=>validator(),
        builder: (formFieldState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              child,
              if (formFieldState.hasError)
                Container(
                  margin: margin,
                  padding: const EdgeInsets.only(top: 10,),
                  child: Text(
                    formFieldState.errorText!,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: Colors.red[700],
                      //height: 0.5
                    ),
                  ),
                )
            ],
          );
        }
      );
   }
}