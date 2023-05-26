import 'package:coza_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/base_screen.dart';
import '../../components/custom_button.dart';
import '../../models/login/LoginResponse.dart';
import '../../models/login/User.dart';
import '../../res/images.dart';
import '../../utils/helpers.dart';
import '../home/home_controller.dart';
import '../view_profile/view_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          title: "Profile",
          rightIcon: Container(
            height: 40.0,
            width: 60.0,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(10.0)),
            child: const Center(
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
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: InkWell(
                    onTap: () => Get.to(const ViewProfile()),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: homeController.user.value!.profilePicture != null
                                          ? NetworkImage(
                                          homeController.user.value!.profilePicture!)
                                      as ImageProvider
                                          : AssetImage(DEMO_USER_IMAGE)),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(
                                      homeController.user.value!.firstName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          height: 1,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Text(
                                    "View Profile Information",
                                    style: TextStyle(
                                        fontSize: 11.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("OVERVIEW"),
                  ],
                ),
                profileItems(
                    itemIcon: NOTE_IMAGE_ICON,
                    title: "My Testimonies",
                    hasEndIcon: true),
                Row(
                  children: [
                    Expanded(
                        child: profileItems(
                            itemIcon: SUBSCRIPTION_ICON,
                            title: "Subscriptions",
                            isFull: false)),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                        child: profileItems(
                            itemIcon: GALLERY_ICON,
                            isFull: false,
                            title: "My Gallery")),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("NOTIFICATION"),
                  ],
                ),
                profileItems(
                    itemIcon: FORBIDDEN_ICON,
                    title: "Do not disturb",
                    subTitle: "Off"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomButton(
                      label: "Logout",
                      onPressed: () => homeController.logout()),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Padding profileItems(
      {required String itemIcon,
      required String title,
      bool isFull = true,
      String? subTitle,
      bool? hasEndIcon = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
            color: lightGrey, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        itemIcon,
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
                            fontSize: title.length > 10 && !isFull ? 14 : 16.0,
                            height: 1,
                            color: primaryColor),
                      ),
                      subTitle != null
                          ? Text(
                              subTitle,
                              style: TextStyle(
                                  fontSize: 10.0, color: primaryColor),
                            )
                          : Container(),
                    ],
                  ),
                ],
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
