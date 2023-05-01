import 'package:coza_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/base_screen.dart';
import '../../res/images.dart';
import '../../utils/helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          title: "Profile",
          rightIcon: Container(
            height: 40.0,
            width: 60.0,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10.0)),
            child: Center(
                child: Text(
              "Done",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: deviceWidth(context),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
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
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(DEMO_USER_IMAGE)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Jennifer",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 1,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Complete Profile Registration",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                profileItems(NOTE_IMAGE_ICON, "My Testimonies", hasEndIcon: true),
                Row(
                  children: [
                    Expanded(child: profileItems(NOTE_IMAGE_ICON, "Subscriptions")),
                    Expanded(child: profileItems(NOTE_IMAGE_ICON, "My Gallery")),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Padding profileItems(String itemIcon, String title,
      {bool? hasEndIcon = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: lightGrey, borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Get.to(const ProfileScreen()),
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          NOTE_IMAGE_ICON,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              height: 1,
                              color: primaryColor),
                        ),
                        Text(
                          "Complete Profile Registration",
                          style: TextStyle(fontSize: 10.0, color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
              if (hasEndIcon!)
                Icon(
                  Icons.edit,
                  color: primaryColor,
                )
            ],
          ),
        ),
      ),
    );
  }
}
