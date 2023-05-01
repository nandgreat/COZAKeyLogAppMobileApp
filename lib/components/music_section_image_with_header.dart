import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/images.dart';

class MusicSectionImageWithHeader extends StatelessWidget {
  final String headerTitle;
  final String imageString;
  final VoidCallback? onPressed;


  const MusicSectionImageWithHeader({Key? key, required this.headerTitle, required this.imageString, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 90.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: AssetImage(imageString), fit: BoxFit.fill)),
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
