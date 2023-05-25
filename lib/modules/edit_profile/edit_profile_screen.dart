import 'dart:math';

import 'package:coza_app/res/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../components/base_screen.dart';
import '../../components/custom_text_input.dart';
import '../../models/login/LoginResponse.dart';
import '../../models/login/User.dart';
import '../../res/images.dart';
import '../../utils/helpers.dart';
import 'edit_profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  List<String> campusList = [
    'Guzape Campus',
    'Gwarimpa Campus',
    'Maraba Campus',
    'Karu Campus',
    'Gwagwalada Campus',
    'Kuje Campus',
    'FHA Lugbe Campus',
    'Wuse Zone 5 Campus',
    'Kubwa Campus',
    'Dubai Campus',
    'Manchester Campus',
    'Port Harcourt Campus',
    'Ilorin Campus',
    'Lagos Campus'
  ];

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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BaseScreen(
          title: "Edit Profile",
          rightIcon: InkWell(
            onTap: editProfileController.updateProfile,
            child: Container(
              height: 40.0,
              width: 60.0,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Obx(() => Center(
                  child: editProfileController.isLoading.value
                      ? const SpinKitCircle(
                          size: 30.0,
                          color: Colors.white,
                        )
                      : const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ))),
            ),
          ),
          child: SingleChildScrollView(
            reverse: true,
            child: SizedBox(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ListTile(
                                      leading: const Icon(Icons.camera),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        Get.back();
                                        editProfileController
                                            .uploadImage(ImageSource.camera);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Gallery'),
                                      onTap: () {
                                        Get.back();
                                        editProfileController
                                            .uploadImage(ImageSource.gallery);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Obx(() => Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(60.0),
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage:
                                editProfileController.imageUrl.value.isEmpty
                                    ? const AssetImage(DEMO_USER_IMAGE)
                                    : NetworkImage(editProfileController
                                        .imageUrl.value
                                        .toString()) as ImageProvider,
                          ))),
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
                  enabled: false,
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
                  prefixIcon: const Icon(CupertinoIcons.phone),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: 'Select Gender',
                  label: "Gender",
                  onFieldTap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  leading: const Icon(Icons.male),
                                  title: const Text('Male'),
                                  onTap: () {
                                    Get.back();
                                    editProfileController
                                        .genderController.text = "Male";
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  leading: const Icon(Icons.female),
                                  title: const Text('Female'),
                                  onTap: () {
                                    Get.back();
                                    editProfileController
                                        .genderController.text = "Female";
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  ignoreCursor: true,
                  controller: editProfileController.genderController,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: 'Select Campus',
                  label: "Campus",
                  onFieldTap: () {
                    showBarModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Select Campus",
                                      style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 18.0),),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListView.builder(
                                    itemCount: campusList.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context, int index) {
                                      // access element from list using index
                                      // you can create and return a widget of your choice
                                      return ListTile(
                                        leading: const Icon(Icons.church),
                                        title: Text(campusList[index]),
                                        onTap: () {
                                          Get.back();
                                          editProfileController.campusController
                                              .text = campusList[index];
                                        },
                                      );
                                    }
                                ) ,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  ignoreCursor: true,
                  controller: editProfileController.campusController,
                  prefixIcon: const Icon(Icons.church_outlined),
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
                  onFieldTap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  title: const Text('Single'),
                                  onTap: () {
                                    Get.back();
                                    editProfileController
                                        .maritalStatusController
                                        .text = "Single";
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  title: const Text('Married'),
                                  onTap: () {
                                    Get.back();
                                    editProfileController
                                        .maritalStatusController
                                        .text = "Married";
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  title: const Text('Widowed'),
                                  onTap: () {
                                    Get.back();
                                    editProfileController
                                        .maritalStatusController
                                        .text = "Widowed";
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  ignoreCursor: true,
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
}
