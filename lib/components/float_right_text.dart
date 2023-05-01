import 'package:flutter/cupertino.dart';

import '../res/color_palette.dart';

class FloatRightText extends StatelessWidget {
  final String? text;

  const FloatRightText({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:  [
        Text(
          text!,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
