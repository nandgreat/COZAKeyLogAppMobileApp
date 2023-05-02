import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/color_palette.dart';
import '../res/images.dart';
import '../utils/helpers.dart';
import 'custom_button.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: deviceWidth(context) - 50,
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: primaryColor,
                  thickness: 1.0,
                ),
              ),
              const Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "or Continue with",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: primaryColor,
                  thickness: 1.0,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  label: "Gmail",
                  labelColor: primaryColor,
                  onPressed: () => {},
                  icon: SvgPicture.asset(GOOGLE_ICON),
                  backgroundColor: inputTextFillColor,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  label: "Facebook",
                  onPressed: () => {},
                  labelColor: primaryColor,
                  icon: SvgPicture.asset(FACEBOOK_ICON),
                  backgroundColor: inputTextFillColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
