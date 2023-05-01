import 'package:coza_app/utils/bottom_nav_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../components/base_screen.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_input.dart';
import '../../components/music_section_image_with_header.dart';
import '../../components/music_section_image_with_inner_text.dart';
import '../../components/section_image_with_header.dart';
import '../../res/images.dart';
import '../../utils/helpers.dart';

import '../../utils/helpers.dart';

class COZACityMusicScreen extends StatefulWidget {
  const COZACityMusicScreen({Key? key}) : super(key: key);

  @override
  State<COZACityMusicScreen> createState() => _COZACityMusicScreenState();
}

class _COZACityMusicScreenState extends State<COZACityMusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          title: "Discover",
          leftIcon: const Icon(BottomNavIcons.browse_icon),
          rightIcon: SvgPicture.asset(SETTINGS_ICON),
          child: SingleChildScrollView(
            child: SizedBox(
              width: deviceWidth(context) - 50,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                CustomTextField(
                  hintText: 'Search Music',
                  prefixIcon: Icon(CupertinoIcons.search),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MusicSectionImageWithHeader(
                        headerTitle: "You",
                        imageString: ADD_MUSIC_IMAGE,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),
                      MusicSectionImageWithHeader(
                        headerTitle: "Worship",
                        imageString: MUSIC_IMAGE_ONE,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),
                      MusicSectionImageWithHeader(
                        headerTitle: "Refresh",
                        imageString: MUSIC_IMAGE_TWO,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),
                      MusicSectionImageWithHeader(
                        headerTitle: "Praise",
                        imageString: MUSIC_IMAGE_THREE,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),
                      MusicSectionImageWithHeader(
                        headerTitle: "Traditional",
                        imageString: MUSIC_IMAGE_FOUR,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Made for you",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 150.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MusicSectionImageWithInnerText(
                        headerTitle: "Meditation",
                        imageString: SECOND_SLIDER_ONE,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),
                      MusicSectionImageWithInnerText(
                        headerTitle: "Uplifting",
                        imageString: SECOND_SLIDER_TWO,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),
                      MusicSectionImageWithInnerText(
                        headerTitle: "Spiritual",
                        imageString: SECOND_SLIDER_THREE,
                        onPressed: () {
                          // Get.to(SermonScreen());
                        },
                      ),


                    ],
                  ),
                ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 50,
                            height: 220.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: const DecorationImage(
                                    image: AssetImage(COZA_BANNER), fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Hit",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          MusicSectionImageWithInnerText(
                            headerTitle: "Meditation",
                            imageString: SECOND_SLIDER_ONE,
                            onPressed: () {
                              // Get.to(SermonScreen());
                            },
                          ),
                          MusicSectionImageWithInnerText(
                            headerTitle: "Uplifting",
                            imageString: SECOND_SLIDER_TWO,
                            onPressed: () {
                              // Get.to(SermonScreen());
                            },
                          ),
                          MusicSectionImageWithInnerText(
                            headerTitle: "Spiritual",
                            imageString: SECOND_SLIDER_THREE,
                            onPressed: () {
                              // Get.to(SermonScreen());
                            },
                          ),


                        ],
                      ),
                    ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
