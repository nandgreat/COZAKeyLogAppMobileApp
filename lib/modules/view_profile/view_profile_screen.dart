import 'package:coza_app/modules/edit_profile/edit_profile_screen.dart';
import 'package:coza_app/res/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/base_screen.dart';
import '../../models/login/LoginResponse.dart';
import '../../models/login/User.dart';
import '../../res/images.dart';
import '../../utils/helpers.dart';
import '../home/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
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
          child: SingleChildScrollView(
            child: SizedBox(
                width: deviceWidth(context),
                child: Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Container(
                          width: deviceWidth(context),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0))),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10, 48.0, 10, 30),
                            child: Column(
                              children: [
                                Text(
                                  '${homeController.user.value!.firstName} ${homeController.user.value!.lastName!}',
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  'Kubwa Campus, Abuja',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  homeController.user.value!.email!,
                                  style: const TextStyle(
                                      fontSize: 14.0, color: Color(0xFF6369D1)),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(EditProfile());
                                  },
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: primaryColor, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          FaIcon(
                                            FontAwesomeIcons.pencil,
                                            size: 18.0,
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Text("Edit")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                profileItems(
                                  label: "Full Name",
                                  value:
                                      "${homeController.user.value!.firstName} ${homeController.user.value!.lastName}",
                                  itemIcon: FontAwesomeIcons.user,
                                ),
                                profileItems(
                                  label: "Mobile Number",
                                  value: "${homeController.user.value!.phone}",
                                  itemIcon: FontAwesomeIcons.phone,
                                ),
                                profileItems(
                                  label: "Country",
                                  value:
                                      "${homeController.user.value!.country}",
                                  itemIcon: FontAwesomeIcons.phone,
                                ),
                                profileItems(
                                  label: "Password",
                                  value:
                                      "Change Password",
                                  hasEndIcon: true,
                                  itemIcon: FontAwesomeIcons.lock,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(35.0),
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                image: const DecorationImage(
                                    image: AssetImage(DEMO_USER_IMAGE)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Padding profileItems(
      {required IconData itemIcon,
      required String label,
      required String value,
      bool? hasEndIcon = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    InkWell(
                      child: SizedBox(
                        child: FaIcon(
                          itemIcon,
                          size: 20,
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
                          label,
                          style: TextStyle(fontSize: 12.0, color: primaryColor),
                        ),
                        Text(
                          value,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              height: 1,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                )),
                if (hasEndIcon!)
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: primaryColor,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
