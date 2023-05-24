import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/modules/home/home_controller.dart';
import 'package:coza_app/modules/home/home_controller.dart';
import 'package:coza_app/modules/sermons/sermons_screen.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:coza_app/utils/local_storage_helper.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../components/section_header.dart';
import '../../components/section_image_with_header.dart';
import '../../components/section_image_with_header_and_sub.dart';
import '../../components/section_large_image_with_header.dart';
import '../../components/section_parternship_image_with_header.dart';
import '../../models/login/LoginResponse.dart';
import '../../models/login/User.dart';
import '../../res/color_palette.dart';
import '../../res/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../coza_city/coza_city_screen.dart';
import '../coza_kids/coza_kids_screen.dart';
import '../profile/profile_screen.dart';

final pageList = [DECREE_YOUR_DAY_IMAGE, DECREE_YOUR_DAY_IMAGE];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  HomeController homeController = Get.put(HomeController());

  User user = User();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await homeController.getUser();
    });
    super.initState();
  }

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
                          InkWell(
                            onTap: () => Get.to(const ProfileScreen()),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: primaryColor),
                                image: const DecorationImage(
                                    image: AssetImage(DEMO_USER_IMAGE)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Obx(() => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Welcome"),
                                  Text(
                                    homeController.user.value!.firstName!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        height: 1,
                                        color: primaryColor),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )),
                    SvgPicture.asset(
                      COMMENT_ICON,
                      height: 30.0,
                      width: 50.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        NOTIFICATION_ICON,
                        height: 30.0,
                        width: 50.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: deviceWidth(context),
                  padding: EdgeInsets.only(left: 0.0),
                  child: ExpandablePageView.builder(
                    controller: controller,
                    pageSnapping: true,
                    padEnds: false,
                    // itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return homeSlider(context, index % pageList.length);
                    },
                    itemCount: pageList.length,
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: pageList.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const SectionHeader(
                  title: "Sections",
                  endText: "See all",
                ),
                SizedBox(
                  height: 220,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SectionImageWithHeader(
                        headerTitle: "Sermon",
                        imageString: PB_IMAGE,
                        onPressed: () {
                          Get.to(SermonScreen());
                        },
                      ),
                      SectionImageWithHeader(
                        headerTitle: "COZA City Music",
                        imageString: COZA_CITY_MUSIC_IMAGE,
                        onPressed: () {
                          Get.to(COZACityMusicScreen());
                        },
                      ),
                      SectionImageWithHeader(
                        headerTitle: "COZA Kids",
                        imageString: COZA_KIDS_IMAGE,
                        onPressed: () {
                          Get.to(COZAKidsScreen());
                        },
                      ),
                    ],
                  ),
                ),
                const SectionHeader(title: "Popular on App"),
                SizedBox(
                  height: 220,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      const SectionLargeImageWithHeader(
                        headerTitle: "Sermon",
                        imageString: MANCHESTER_PB,
                      ),
                      const SectionLargeImageWithHeader(
                        headerTitle: "Sermon",
                        imageString: TUESDAY_PB,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SectionHeader(
                  title: "New Music",
                  endText: "See all",
                ),
                SizedBox(
                  height: 220,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SectionImageWithHeaderAndSub(
                        headerTitle: "Million Little Miracles",
                        imageString: MILLION_MIRACLES_IMAGE,
                        subHeading: "Worship Session",
                      ),
                      SectionImageWithHeaderAndSub(
                        headerTitle: "African Fusion Praise",
                        imageString: AFRICAN_PRAISE_IMAGE,
                        subHeading: "COZA Music Team",
                      ),
                      SectionImageWithHeaderAndSub(
                        headerTitle: "Dependable God",
                        imageString: ESTHER_ORJI_DEPENDABLE,
                        subHeading: "Ester Orji",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 220,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SectionImageWithHeaderAndSub(
                        headerTitle: "Million Little Miracles",
                        imageString: MILLION_MIRACLES_IMAGE,
                        subHeading: "Worship Session",
                      ),
                      SectionImageWithHeaderAndSub(
                        headerTitle: "African Fusion Praise",
                        imageString: AFRICAN_PRAISE_IMAGE,
                        subHeading: "COZA Music Team",
                      ),
                      SectionImageWithHeaderAndSub(
                        headerTitle: "Dependable God",
                        imageString: ESTHER_ORJI_DEPENDABLE,
                        subHeading: "Ester Orji",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                const SectionHeader(
                  title: "Membership",
                ),
                SizedBox(
                  height: 120,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      SectionPartnershipImageWithHeader(
                        headerTitle: "Partnership",
                        imageString: PARTNERSHIP_IMAGE,
                      ),
                      SectionPartnershipImageWithHeader(
                        headerTitle: "Tithe",
                        imageString: TITHE_IMAGE,
                      ),
                      SectionPartnershipImageWithHeader(
                        headerTitle: "Seed",
                        imageString: SEED_IMAGE,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                )
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
