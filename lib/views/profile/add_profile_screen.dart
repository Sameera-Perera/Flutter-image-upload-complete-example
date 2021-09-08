import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/controllers/profileController.dart';
import 'package:flutter_rest_api_image_upload/widgets/loading_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProfileScreen extends StatefulWidget {
  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    profileController.clearController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Profile'
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Form(
              key: profileController.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  GetBuilder<ProfileController>(
                    builder: (_c) => Container(
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
                            CircleAvatar(
                              backgroundImage: profileController.pickedFile!=null
                                  ? FileImage(
                                File(profileController.pickedFile!.path),
                                // height: 300.0,
                                // fit: BoxFit.scaleDown,
                              )
                                  : AssetImage('assets/images/no_user.jpg') as ImageProvider,
                            ),
                            Positioned(
                              right: -16,
                              bottom: 0,
                              child: SizedBox(
                                height: 46,
                                width: 46,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.white),
                                  ),
                                  color: Colors.grey[200],
                                  onPressed: () {
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
                                                profileController.selectImage(ImageSource.camera);
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.image),
                                              title: Text('Gallery'),
                                              onTap: () {
                                                profileController.selectImage(ImageSource.gallery);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: profileController.firstName,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "First name",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: profileController.lastName,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Last name",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: profileController.address,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Address",
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: profileController.contactNumber,
                    onEditingComplete: () => node.nextFocus(),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Contact Number",
                    ),
                  ),
                  SizedBox(height: 30),
                  Obx(() {
                    if (profileController.isLoading.value)
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
                            profileController.create();
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
      ),
    );
  }
}
