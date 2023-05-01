import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/images.dart';

class BrowseSectionImageWithHeader extends StatelessWidget {
  final String headerTitle;
  final String imageString;
  final VoidCallback? onPressed;


  const BrowseSectionImageWithHeader({Key? key, required this.headerTitle, required this.imageString, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageString), fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                headerTitle,
                style: TextStyle(fontSize: 13.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
