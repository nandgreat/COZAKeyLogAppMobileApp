import 'dart:convert';

import 'package:coza_app/controllers/connection_manager_controller.dart';
import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/data/repositories/user_repository.dart';
import 'package:coza_app/models/edit_profile/UploadProfileResponse.dart';
import 'package:coza_app/models/edit_profile/UploadResponse.dart';
import 'package:coza_app/modules/bottom_nav/bottom_dart.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:coza_app/utils/local_storage_helper.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/edit_profile/EditProfileRequest.dart';
import '../../models/edit_profile/UploadProfileResponse.dart';
import '../../models/login/User.dart' as login;
import '../../models/edit_profile/UploadProfileResponse.dart' as up;

class EditProfileController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final UserRepository _userRepository = UserRepository();
  Rx<login.User?> user = login.User().obs;
  LocalStorageHelper localStorageHelper = LocalStorageHelper();
  var isLoading = false.obs;

  var isImageUploading = false.obs;

  var imageUrl = "".obs;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var occupationController = TextEditingController();
  var maritalStatusController = TextEditingController();
  var genderController = TextEditingController();
  var phoneController = TextEditingController();
  var campusController = TextEditingController();

  // campus
  // isMember
  // addresses

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  Future<void> getUser() async {
    user.value = await localStorageHelper.getUser();
    logItem("±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±");
    firstNameController.text = user.value!.firstName!;
    lastNameController.text = user.value!.lastName!;
    emailController.text = user.value!.email!;
    phoneController.text = user.value!.phone!;
    imageUrl.value = user.value!.profilePicture!;
    logItem(user.value!.firstName);
  }

  void uploadImage(ImageSource imageSource) async {
    try {
      // if(imageSource == ImageSource.camera) {
      //   await Permission.camera.request();
      // }else{
      //   await Permission.photos.request();
      // }

      var permissionStatus = imageSource == ImageSource.gallery
          ? await Permission.photos.request().isGranted
          : await Permission.camera.request().isGranted;
// logItem("===============--------------------========================");
//       logItem(permissionStatus);

      if (permissionStatus) {
        final pickedFile = await ImagePicker().pickImage(source: imageSource);
        print("File is picked");

        if (pickedFile != null) {
          final _picker = ImagePicker();

          //Cropping the image
          CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            compressQuality: 100,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            maxWidth: 512,
            maxHeight: 512,
          );

          try {
            isImageUploading.value = true;

            //Select Image
            var file = File(croppedFile!.path);

            if (file != null) {
              //Upload to Firebase

              var response = await _userRepository.uploadImage(file);

              if (response.isOk) {
                imageUrl.value =
                    UploadResponse.fromJson(response.body).data!.url!;

                // logItem(response);
                Get.snackbar('Success', 'Image uploaded successfully',
                    backgroundColor: Colors.green,
                    margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
              }
            } else {
              Get.snackbar('Failed', 'Image not selected',
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
            }
          } catch (e) {
            logItem("---------------Image upload error-----------------");
            logItem(e.toString());
            Get.snackbar('Failed', 'Error uploading file',
                margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
          }
        }
      } else {
        Get.snackbar('Failed', 'Permission not granted',
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));

        print('Grant Permissions and try again');
      }
    } catch (e) {
      isImageUploading.value = false;
      // emit(UploadImageFailed(e.toString()));
    }
  }

  Future<void> updateProfile() async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar();
      return;
    }

    isLoading.value = true;

    EditProfileRequest loginRequest = EditProfileRequest(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      profilePicture: imageUrl.value,
      maritalStatus: maritalStatusController.text,
      sex: genderController.text,
      campus: campusController.text,
      isMember: true,
      occupation: occupationController.text,
    );

    print(loginRequest);

    try {
      Response response = await _userRepository.updateProfile(loginRequest);

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        up.User? newuser =
            UploadProfileResponse.fromJson(response.body).data?.user;

        login.User updatedUser = user.value!;

        if (newuser!.profilePicture! != "") {
          updatedUser.profilePicture = newuser.profilePicture;
        }
        updatedUser.phone = newuser.phone;
        updatedUser.firstName = newuser.firstName;
        updatedUser.lastName = newuser.lastName;

        String userString = jsonEncode(updatedUser);

        LocalStorageHelper localStorageHelper = LocalStorageHelper();
        await localStorageHelper.storeItem(key: "user", value: userString);

        isLoading.value = false;

        showSnackBar(
            title: "Success", message: "Updated successfully", type: 'success');

        Get.offAll(BottomNav());

        update();
      } else {
        isLoading.value = false;
        var message = UploadResponse.fromJson(response.body).message.toString();

        showSnackBar(title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem("kkkkkkkkkkkkkkkkkkkkkkkk------");
      logItem(e);

      showSnackBar(
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }

  void validateInput() {}
}
