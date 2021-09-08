import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/controllers/vehicleController.dart';
import 'package:flutter_rest_api_image_upload/widgets/loading_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final vehicleController = Get.put(VehicleController());

  @override
  void initState() {
    // TODO: implement initState
    vehicleController.clearController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Add Vehicle'
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: vehicleController.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                SizedBox(height: 40),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: vehicleController.name,
                  onEditingComplete: () => node.nextFocus(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: vehicleController.year,
                  onEditingComplete: () => node.nextFocus(),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'this field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Year",
                  ),
                ),
                SizedBox(height: 10),
                GetBuilder<VehicleController>(
                  builder: (_c) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 115,
                            width: 115,
                            child: Stack(
                              clipBehavior: Clip.none, fit: StackFit.expand,
                              children: [
                                Image(
                                  image : vehicleController.pickedFile1!=null
                                      ? FileImage(
                                    File(vehicleController.pickedFile1!.path),
                                  )
                                      : AssetImage('assets/images/no image.jpeg') as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Get.bottomSheet(
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0)),
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Camera'),
                                    onTap: () {
                                      vehicleController.selectImage1(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text('Gallery'),
                                    onTap: () {
                                      vehicleController.selectImage1(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 115,
                            width: 115,
                            child: Stack(
                              clipBehavior: Clip.none, fit: StackFit.expand,
                              children: [
                                Image(
                                  image : vehicleController.pickedFile2!=null
                                      ? FileImage(
                                    File(vehicleController.pickedFile2!.path),
                                  )
                                      : AssetImage('assets/images/no image.jpeg') as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Get.bottomSheet(
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0)),
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Camera'),
                                    onTap: () {
                                      vehicleController.selectImage2(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text('Gallery'),
                                    onTap: () {
                                      vehicleController.selectImage2(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Obx(() {
                  if (vehicleController.isLoading.value)
                    return LoadingButton(
                      onClick: () async {},
                      color: Colors.blue,
                      childWidget: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  else
                    return LoadingButton(
                      onClick: () async {
                        vehicleController.create();
                      },
                      color: Colors.blue,
                      childWidget: Center(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                      ),
                    );
                }),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
