import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final String? label;
  final TextStyle? labelStyle;
  final String? hint;
  final TextInputType keyBoardType;
  final bool obscureText;
  final TextAlign textAlign;
  final bool enabled;
  final bool obscure;
  final int maxLength;
  final TextCapitalization capitalization;
  final TextInputAction action;
  final VoidCallback? onActionPressed;
  final bool useThemeColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int maxLines;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final bool border;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  TextFieldCustom(
      {required this.controller,
        this.label,
        this.labelStyle,
        this.hint,
        this.useThemeColor = false,
        this.focusNode,
        this.obscure = false,
        this.autofocus = false,
        this.nextFocus,
        this.suffixIcon,
        this.prefixIcon,
        this.onChanged,
        this.maxLength = 150,
        this.action = TextInputAction.next,
        this.capitalization = TextCapitalization.none,
        this.keyBoardType = TextInputType.text,
        this.textAlign = TextAlign.left,
        this.obscureText = false,
        this.onActionPressed,
        this.maxLines = 1,
        this.suffix,
        this.validator,
        this.enabled = true,
        this.border = false,
        this.textAlignVertical});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        textAlignVertical: textAlignVertical,
        focusNode: focusNode,
        obscureText: obscure,
        autocorrect: false,
        enableSuggestions: false,
        autofocus: autofocus,
        style: TextStyle(
          fontSize: 19,
          color: Colors.black
        ),
        onChanged: (value) {
          if (this.onChanged != null) this.onChanged!(value);
        },
        onFieldSubmitted: (String a) {
          if (onActionPressed != null) onActionPressed!();
          if (nextFocus != null) FocusScope.of(context).requestFocus(this.nextFocus);
        },
        keyboardType: keyBoardType,
        textAlign: textAlign,
        textInputAction: action,
        enabled: enabled,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        textCapitalization: capitalization,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffix: suffix,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15, color: Color(0x773B3B3B)),
          fillColor: Colors.white,
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5), borderRadius: BorderRadius.zero),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5), borderRadius: BorderRadius.zero),
          errorStyle: TextStyle(fontSize: 11, color: Colors.red),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          errorMaxLines: 3,
          border:  InputBorder.none,
          labelText: label,
          labelStyle: labelStyle??TextStyle(fontSize:19, color: Color(0xFF8D8D8D)),
        ));
  }
}
