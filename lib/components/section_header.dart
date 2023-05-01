import 'package:flutter/cupertino.dart';

import '../res/color_palette.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? endText;

  const SectionHeader({Key? key, required this.title, this.endText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        endText != null
            ? Text(
                endText!,
                style: TextStyle(color: secondaryColor),
              )
            : Container()
      ],
    );
  }
}
