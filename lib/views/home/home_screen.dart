import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/views/gallery/add_gallery_screen.dart';
import 'package:flutter_rest_api_image_upload/views/gallery/view_gallery_screen.dart';
import 'package:flutter_rest_api_image_upload/views/profile/add_profile_screen.dart';
import 'package:flutter_rest_api_image_upload/views/profile/view_profile_screen.dart';
import 'package:flutter_rest_api_image_upload/views/vehicle/add_vehicle_screen.dart';
import 'package:flutter_rest_api_image_upload/views/vehicle/view_vehicle_screem.dart';
import 'package:flutter_rest_api_image_upload/widgets/loading_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Single Image & Data"),
              SizedBox(height: 5,),
              LoadingButton(
                onClick: () async {
                  Get.to(()=>AddProfileScreen());
                },
                color: Colors.amber,
                childWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LoadingButton(
                onClick: () async {
                  Get.to(()=>ViewProfileScreen());
                },
                color: Colors.amber,
                childWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text("Multiple Image & Data"),
              SizedBox(height: 5,),
              LoadingButton(
                onClick: () async {
                  Get.to(()=>AddVehicleScreen());
                },
                color: Colors.lightGreen,
                childWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add Vehicle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LoadingButton(
                onClick: () async {
                  Get.to(()=>ViewVehicleScreen());
                },
                color: Colors.lightGreen,
                childWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Vehicle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text("Dynamic Number Of Image & Data"),
              SizedBox(height: 5,),
              LoadingButton(
                onClick: () async {
                  Get.to(()=>AddGalleryScreen());
                },
                color: Colors.lightBlue,
                childWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add Gallery',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LoadingButton(
                onClick: () async {
                  Get.to(ViewGalleryScreen());
                },
                color: Colors.lightBlue,
                childWidget: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Gallery',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
