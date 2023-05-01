import 'package:coza_app/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/base_screen.dart';
import '../../components/browse_section_image_with_header.dart';
import '../../utils/helpers.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          showBackBtn: false,
          title: "Browse",
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: deviceWidth(context),
                  height: deviceHeight(context) - 50,
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    primary: false,
                    children: const [
                      BrowseSectionImageWithHeader(headerTitle: "Sermons", imageString: PB_IMAGE),
                      BrowseSectionImageWithHeader(headerTitle: "COZA City Music", imageString: COZA_CITY_MUSIC_IMAGE),
                      BrowseSectionImageWithHeader(headerTitle: "Devotionals", imageString: DEVOTIONALS_IMAGE),
                      BrowseSectionImageWithHeader(headerTitle: "Events", imageString: EVENTS_IMAGE),
                      BrowseSectionImageWithHeader(headerTitle: "Events", imageString: COZA_KIDS_IMAGE),
                      BrowseSectionImageWithHeader(headerTitle: "Events", imageString: STORE_IMAGE)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
