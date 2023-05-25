import 'package:coza_app/res/color_palette.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef CustomCallBack = String Function(String value);

class CustomTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final bool? ignoreCursor;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  late final bool? obscureText;
  final bool togglePassword;
  final bool enabled;
  final Function? validator;
  final TextEditingController? controller;
  final String? Function(String)? functionValidate;
  final String? parametersValidate;
  final int? maximumLines;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final String? label;

  CustomTextField(
      {required this.hintText,
      this.focusNode,
      this.textInputType,
      this.defaultText,
      this.ignoreCursor = false,
      this.maximumLines = 1,
      this.onTap,
        this.enabled = true,
      this.obscureText = false,
      this.togglePassword = false,
      this.controller,
      this.validator,
      this.functionValidate,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
      this.onSubmitField,
      this.onFieldTap,
      this.prefixIcon,
      this.suffixIcon,
      this.label});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  double bottomPaddingToError = 12;
  late bool _obscureText;


  @override
  void initState() {
    _obscureText = widget.obscureText!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Text(
                  widget.label!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 17.0,
                  ),
                )
              : Container(),
          widget.label != null
              ? const SizedBox(
                  height: 5.0,
                )
              : Container(),
          TextFormField(
            cursorColor: primaryColor,
            obscureText: _obscureText,
            keyboardType: widget.textInputType,
            readOnly: widget.ignoreCursor!,
            enabled: widget.enabled,
            textInputAction: widget.actionKeyboard,
            maxLines: widget.maximumLines,
            focusNode: widget.focusNode,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            initialValue: widget.defaultText,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ?? (widget.togglePassword ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    logItem(_obscureText);
                    _obscureText = !_obscureText;
                  });
                },
              ): null),
              filled: true,
              fillColor: Colors.grey[200],
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(color: Colors.grey[100]!, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(color: primaryColor),
              ),
              hintStyle: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14.0,
                  fontWeight: FontWeight.w200),
              contentPadding: EdgeInsets.only(
                  top: 10,
                  bottom: bottomPaddingToError,
                  left: 10.0,
                  right: 10.0),
              isDense: true,
              errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
            controller: widget.controller,
            validator: (value) => widget.functionValidate != null
                ? widget.functionValidate!(value!)
                : commonValidation(value!, widget.label!),
            onFieldSubmitted: (value) {
              if (widget.onSubmitField != null) widget.onSubmitField!();
            },
            onTap: () {
              if (widget.onFieldTap != null) widget.onFieldTap!();
            },
          ),
        ],
      ),
    );
  }
}

String? commonValidation(String value, String fieldName) {
  var required = requiredValidator(value, fieldName);
  if (required != null) {
    return required;
  }
  return null;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return "$messageError is required";
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
