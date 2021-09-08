import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/models/vehicle.dart';
import 'package:flutter_rest_api_image_upload/services/profile_service.dart';
import 'package:flutter_rest_api_image_upload/services/vehicle_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VehicleController extends GetxController {
  TextEditingController name = new TextEditingController();
  TextEditingController year = new TextEditingController();
  XFile? pickedFile1;
  XFile? pickedFile2;
  var isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  List<Vehicle> vehicles = List<Vehicle>.empty(growable: true).obs;

  void selectImage1(ImageSource imageSource) async {
    try {
      pickedFile1 = await ImagePicker().pickImage(source: imageSource);
    } finally {
      if (Get.isBottomSheetOpen ?? true) Get.back();
      update();
    }
  }

  void selectImage2(ImageSource imageSource) async {
    try {
      pickedFile2 = await ImagePicker().pickImage(source: imageSource);
    } finally {
      if (Get.isBottomSheetOpen ?? true) Get.back();
      update();
    }
  }

  void create() async {
    try {
      isLoading(true);
      if(formKey.currentState!.validate()){
        if (pickedFile1 != null) {
          Dio.FormData formData = new Dio.FormData.fromMap({
            "name": name.text,
            "year": year.text,
            "image_1": await Dio.MultipartFile.fromFile(pickedFile1!.path,
                filename: pickedFile1!.path.split('/').last),
            "image_2": await Dio.MultipartFile.fromFile(pickedFile2!.path,
                filename: pickedFile2!.path.split('/').last)
          });

          bool result = await VehicleServices.create(formData);
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
      var _data = await VehicleServices.fetch();
      if(_data!=null){
        vehicles.assignAll(vehicleFromJson(jsonEncode(_data)));
      }
    } finally {
      isLoading(false);
    }
  }

  void clearController() {
    name.clear();
    year.clear();
    pickedFile1 = null;
    pickedFile2 = null;
    update();
  }
}
