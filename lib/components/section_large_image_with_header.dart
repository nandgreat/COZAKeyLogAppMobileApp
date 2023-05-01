import 'package:flutter/cupertino.dart';

import '../res/images.dart';

class SectionLargeImageWithHeader extends StatelessWidget {
  final String headerTitle;
  final String imageString;


  const SectionLargeImageWithHeader({Key? key, required this.headerTitle, required this.imageString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 220.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: AssetImage(imageString), fit: BoxFit.fitHeight)),
          ),
        ],
      ),
    );
  }
}
