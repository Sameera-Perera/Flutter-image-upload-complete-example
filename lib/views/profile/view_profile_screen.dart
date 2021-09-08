import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/controllers/profileController.dart';
import 'package:flutter_rest_api_image_upload/models/profile.dart';
import 'package:get/get.dart';

class ViewProfileScreen extends StatefulWidget {
  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      profileController.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx((){
          if(!profileController.isLoading.value)
            return ListView.builder(
              shrinkWrap: true,
              itemCount: profileController.profiles.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return ProfileCard(profile: profileController.profiles[index]);
              },
            );
          else
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            );
        }),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Profile profile;
  const ProfileCard({required this.profile});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.1,
                          color: Colors.black87),
                    ),
                    Text(
                      '${profile.firstName} ${profile.lastName}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Address',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.1,
                          color: Colors.black87),
                    ),
                    Text(
                      '${profile.address}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Contact Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: -0.1,
                          color: Colors.black87),
                    ),
                    Text(
                      '${profile.contactNumber}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
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
                child: CircleAvatar(
                    backgroundImage: NetworkImage(profile.profilePicture)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

