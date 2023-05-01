import 'package:coza_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
typedef CustomCallBack = String Function(String value);

class CustomTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final Function? validator;
  final TextEditingController? controller;
  final CustomCallBack? functionValidate;
  final String? parametersValidate;
  final int? maximumLines;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final String? label;

  const CustomTextField(
      {required this.hintText,
      this.focusNode,
      this.textInputType,
      this.defaultText,
      this.maximumLines = 1,
      this.obscureText = false,
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
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  double bottomPaddingToError = 12;

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
            obscureText: widget.obscureText!,
            keyboardType: widget.textInputType,
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
              suffixIcon: widget.suffixIcon,
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
            validator: (value) => commonValidation(value!, widget.label!),
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
