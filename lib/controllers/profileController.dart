import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/models/profile.dart';
import 'package:flutter_rest_api_image_upload/services/profile_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController contactNumber = new TextEditingController();
  XFile? pickedFile;
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  List<Profile> profiles = List<Profile>.empty(growable: true).obs;

  void selectImage(ImageSource imageSource) async {
    try {
      pickedFile = await ImagePicker().pickImage(source: imageSource);
    } finally {
      if (Get.isBottomSheetOpen ?? true) Get.back();
      update();
    }
  }

  void create() async {
    try {
      isLoading(true);
      if(formKey.currentState!.validate()){
        if (pickedFile != null) {
          Dio.FormData formData = new Dio.FormData.fromMap({
            "first_name": firstName.text,
            "last_name": lastName.text,
            "address": address.text,
            "contact_number": contactNumber.text,
            "profile_picture": await Dio.MultipartFile.fromFile(pickedFile!.path,
                filename: pickedFile!.path.split('/').last)
          });

          bool result = await ProfileServices.create(formData);
          if (result) clearController();
        } else {}
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }

  void fetch() async {
    try {
      isLoading(true);
      var _data = await ProfileServices.fetch();
      if(_data!=null){
        profiles.assignAll(profileFromJson(jsonEncode(_data)));
      }
    } finally {
      isLoading(false);
    }
  }

  void clearController() {
    firstName.clear();
    lastName.clear();
    address.clear();
    contactNumber.clear();
    pickedFile = null;
    update();
  }
}
