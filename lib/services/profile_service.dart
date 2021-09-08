import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/utilities/const.dart';
import 'package:get/get.dart' as GetX;

class ProfileServices {
  static Future<bool> create(FormData data) async {
    try {
      Response response =
      await Dio().post(
          "$baseURL/profiles",
          data: data,
      );
      if(response.statusCode==201){
        GetX.Get.snackbar('Successfully','New Profile Added',
            backgroundColor: Colors.white,
            duration: Duration(seconds: 4),
            animationDuration: Duration(milliseconds: 900),
            margin: EdgeInsets.only(top: 5, left: 10, right: 10)
        );
        return true;
      }
      return false;
    } catch(e){
      return false;
    }
  }

  static Future<dynamic> fetch() async {
    try{
      var response = await Dio().get(
        "$baseURL/profiles"
      ).timeout(Duration(seconds: 10));
      if(response.statusCode == 200) {
        return response.data;
      }
      else{
        // AppSnack.showSnack('Login fail','Invalid pin');
        return null;
      }
    } catch(e){
      return null;
    }
  }
}
