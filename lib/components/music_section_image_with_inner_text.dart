import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/images.dart';

class MusicSectionImageWithInnerText extends StatelessWidget {
  final String headerTitle;
  final String imageString;
  final VoidCallback? onPressed;

  const MusicSectionImageWithInnerText(
      {Key? key,
      required this.headerTitle,
      required this.imageString,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: AssetImage(imageString), fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        headerTitle,
                        style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
