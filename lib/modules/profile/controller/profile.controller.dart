import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/provider/globals.dart';
import '../../../data/model/error_error_message.dart';
import '../../../data/model/profile_picture.dart';
import '../../../data/services/api_service.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/function.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/user_session.dart';

class UserProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  RxString errorMessages = ''.obs;
  RxBool isLoading = false.obs;
  XFile uploadFile = XFile("");

  RxBool notificationStatus = true.obs;

  void onPressUpdateEmail() {
    Get.toNamed(Routes.UPDATE_EMAIL);
  }

  void onPressUpdatePassword() {
    Get.toNamed(Routes.UPDATE_PASSWORD);
  }

  void changeProfilePicture() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('upload_profile_picture'.tr,
                  style: const TextStyle(fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text('take_photo'.tr),
              onTap: () => onImageOptionSelect(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: Text('choose_image'.tr),
              onTap: () => onImageOptionSelect(ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: Text('cancel'.tr),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 35),
          ],
        );
      },
    );
  }

  Future<void> onImageOptionSelect(ImageSource source) async {
    try {
      Navigator.of(Get.context!).pop();
      final _pickedImage = await _picker.pickImage(
        source: source,
      );
      if (_pickedImage != null) {
        cropImage(_pickedImage.path);
      }
    } catch (err, stack) {
      debugPrint(err.toString());
      debugPrint(stack.toString());
    }
  }

  Future<void> cropImage(String filePath) async {
    final File? croppedFile =
        await ImageCropper.cropImage(sourcePath: filePath);
    if (croppedFile != null) {
      uploadImage(croppedFile);
    }
  }

  Future<void> uploadImage(File file) async {
    try {
      isLoading.toggle();
      final ProfilePicture response =
          await ApiService.shared().updateProfilePicture(file);
      if (response.sizes.isNotEmpty) {
        Globals.profilePicture.value = response;
        UserSessionManager.shared.setProfilePictureToDB(response);
        SnackbarUtil.showSuccess(
            message: "Profile picture updated successfully"); //! hardcoded
      }
      isLoading.toggle();
    } on DioError catch (e) {
      isLoading.toggle();
      if (e.response != null) {
        final ErrorMessage error =
            ErrorMessage.fromJson(e.response!.data as Map<String, dynamic>);
        if (error.error.message!.isNotEmpty) {
          errorMessages.value = error.error.message!;
        }
        returnResponse(e.response!);
      }
    } catch (err, stack) {
      isLoading.toggle();
      debugPrint(err.toString());
      debugPrint(stack.toString());
    }
  }

  Future<void> onNotificationSwitchChange({required  bool value}) async {
    notificationStatus.value = value;
    if (value) {
      await FirebaseMessaging.instance.subscribeToTopic("topup");
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic("topup");
    }
  }
}