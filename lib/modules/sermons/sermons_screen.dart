import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/helpers.dart';

import '../../components/base_screen.dart';
import '../../components/custom_text_input.dart';
import '../../components/section_header.dart';
import '../../components/section_image_with_header_and_sub.dart';
import '../../components/section_large_image_with_header.dart';
import '../../res/images.dart';

class SermonScreen extends StatefulWidget {
  const SermonScreen({Key? key}) : super(key: key);

  @override
  State<SermonScreen> createState() => _SermonScreenState();
}

class _SermonScreenState extends State<SermonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          title: "Sermons",
          child: SingleChildScrollView(
            child: SizedBox(
              width: deviceWidth(context) - 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Search Video Sermons',
                          prefixIcon: Icon(CupertinoIcons.search),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                COMMENT_ICON,
                                height: 30.0,
                                width: 50.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const SectionHeader(
                    title: "Browse Categories",
                    endText: "See all",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: const <Widget>[
                        SectionImageWithHeaderAndSub(
                          headerTitle: "Faith Filled",
                          imageString: SERMON_ONE_IMAGE,
                          subHeading: "Pst. Biodun Fatoyinbo",
                        ),
                        SectionImageWithHeaderAndSub(
                          headerTitle: "Key of Wisdom",
                          imageString: SERMON_TWO_IMAGE,
                          subHeading: "Pst. Biodun Fatoyinbo",
                        ),
                        SectionImageWithHeaderAndSub(
                          headerTitle: "Key to Wisdom",
                          imageString: PB_IMAGE,
                          subHeading: "Pst. Biodun Fatoyinbo",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  const SectionHeader(title: "Trending Sermons", endText: "See all"),
                  SizedBox(
                    height: 220,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: const <Widget>[
                        const SectionLargeImageWithHeader(
                          headerTitle: "Sermon",
                          imageString: FULL_IMAGE_SERMOON,
                        ),
                        const SectionLargeImageWithHeader(
                          headerTitle: "Sermon",
                          imageString: TUESDAY_PB,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
