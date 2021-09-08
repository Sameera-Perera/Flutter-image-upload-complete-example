import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/models/gallery.dart';
import 'package:flutter_rest_api_image_upload/services/gallery_service.dart';
import 'package:flutter_rest_api_image_upload/services/profile_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GalleryController extends GetxController {
  TextEditingController name = new TextEditingController();
  List<XFile> pickedFile = [];
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  List<Gallery> galleries = List<Gallery>.empty(growable: true).obs;

  void selectImage() async {
    try {
      pickedFile = (await ImagePicker().pickMultiImage())!;
    } finally {
      if (Get.isBottomSheetOpen ?? true) Get.back();
      update();
    }
  }

  void create() async {
    try {
      isLoading(true);
      if (formKey.currentState!.validate()) {
        var arr = [];
        for (var img in pickedFile) {
          arr.add(await Dio.MultipartFile.fromFile(img.path,
              filename: img.path.split('/').last));
        }
        Dio.FormData formData = new Dio.FormData.fromMap({
          "name": name.text,
          "images": arr
        });

        bool result = await GalleryServices.create(formData);
        if (result) clearController();
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }

  void fetch() async {
    try {
      isLoading(true);
      var _data = await GalleryServices.fetch();
      if (_data != null) {
        galleries.assignAll(galleryFromJson(jsonEncode(_data)));
      }
    } finally {
      isLoading(false);
    }
  }

  void clearController() {
    name.clear();
    pickedFile.clear();
    update();
  }
}
