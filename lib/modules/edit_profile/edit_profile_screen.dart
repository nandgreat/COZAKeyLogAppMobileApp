import 'package:coza_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/base_screen.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_input.dart';
import '../../models/login/LoginResponse.dart';
import '../../res/images.dart';
import '../../utils/helpers.dart';
import '../home/home_controller.dart';
import '../view_profile/view_profile_screen.dart';
import 'edit_profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  User user = User();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await editProfileController.getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          title: "Edit Profile",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          image: const DecorationImage(
                              image: AssetImage(DEMO_USER_IMAGE)),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  hintText: 'Enter First Name',
                  label: "First Name",
                  controller: editProfileController.firstNameController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CustomTextField(
                  hintText: 'Enter Last Name',
                  label: "Last Name",
                  controller: editProfileController.lastNameController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CustomTextField(
                  hintText: 'Enter Email',
                  label: "Email",
                  controller: editProfileController.emailController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CustomTextField(
                  hintText: 'Enter Mobile Number',
                  label: "Mobile Number",
                  controller: editProfileController.phoneController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CustomTextField(
                  hintText: 'Select Gender',
                  label: "Gender",
                  controller: editProfileController.genderController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CustomTextField(
                  hintText: 'Enter Occupation',
                  label: "Occupation",
                  controller: editProfileController.occupationController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 CustomTextField(
                  hintText: 'Select Marital Status',
                  label: "Marital Status",
                  controller: editProfileController.maritalStatusController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                    onTap: () => Get.to(const EditProfile()),
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
