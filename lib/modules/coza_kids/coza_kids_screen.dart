import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/reset_password/reset_password_screen.dart';
import 'package:coza_app/modules/sermons/sermons_screen.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/helpers.dart';

import '../../components/browse_section_image_with_header.dart';
import '../../components/coza_kids_menu_item.dart';
import '../../components/section_header.dart';
import '../../components/section_image_with_header.dart';
import '../../components/section_image_with_header_and_sub.dart';
import '../../components/section_large_image_with_header.dart';
import '../../components/section_parternship_image_with_header.dart';
import '../../res/color_palette.dart';
import '../../res/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../coza_city/coza_city_screen.dart';

final pageList = [DECREE_YOUR_DAY_IMAGE, DECREE_YOUR_DAY_IMAGE];

class COZAKidsScreen extends StatelessWidget {
  COZAKidsScreen({Key? key}) : super(key: key);

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          useToolBar: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  image: AssetImage(COZA_KIDS_AVATAR),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    )),
                    SvgPicture.asset(
                      COMMENT_ICON,
                      height: 30.0,
                      width: 50.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      MENU_ICON,
                      height: 30.0,
                      width: 50.0,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Hello"),
                        Text(
                          "Jasmine",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              height: 1,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: deviceWidth(context),
                  height: deviceHeight(context)-50,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    children: [
                      COZAKidsMenuItem(
                          headerTitle: "COZA Toons",
                          iconImage: PLAY_ICON,
                          color: Colors.black),
                      COZAKidsMenuItem(
                          headerTitle: "Reading",
                          iconImage: BOOK_IMAGE_ICON,
                          color: oxbloodColor),
                      COZAKidsMenuItem(
                          headerTitle: "My Declarations",
                          iconImage: SMILEY_IMAGE_ICON,
                          color: royalBlueColor),
                      COZAKidsMenuItem(
                          headerTitle: "Word",
                          iconImage: MIC_IMAGE_ICON,
                          color: babyBlueColor),
                      COZAKidsMenuItem(
                          headerTitle: "About COZA",
                          iconImage: NOTE_IMAGE_ICON,
                          color: darkBrownColor),
                      COZAKidsMenuItem(
                          headerTitle: "Settings",
                          iconImage: SETTINGS_IMAGE_ICON,
                          color: orangeColor)
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

Widget homeSlider(BuildContext context, int index) {
  return Container(
    width: 130,
    height: 130,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(pageList[index]), fit: BoxFit.contain)),
    margin: const EdgeInsets.only(right: 10),
  );
}
