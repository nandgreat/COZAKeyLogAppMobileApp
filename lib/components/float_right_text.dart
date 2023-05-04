import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/color_palette.dart';

class FloatRightText extends StatelessWidget {
  final String? text;
  final VoidCallback onPress;

  const FloatRightText({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children:  [
          Text(
            text!,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
