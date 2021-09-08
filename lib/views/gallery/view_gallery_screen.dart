import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/controllers/galleryController.dart';
import 'package:flutter_rest_api_image_upload/models/gallery.dart';
import 'package:get/get.dart';

class ViewGalleryScreen extends StatefulWidget {
  @override
  _ViewGalleryScreenState createState() => _ViewGalleryScreenState();
}

class _ViewGalleryScreenState extends State<ViewGalleryScreen> {
  final galleryController = Get.put(GalleryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      galleryController.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx((){
          if(!galleryController.isLoading.value)
            return ListView.builder(
              shrinkWrap: true,
              itemCount: galleryController.galleries.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return GalleryCard(gallery: galleryController.galleries[index]);
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

class GalleryCard extends StatelessWidget {
  final Gallery gallery;
  const GalleryCard({required this.gallery});
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
                '${gallery.name}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: gallery.images.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Image(
                        image: NetworkImage(
                          gallery.images[index].url,
                        ),
                      fit: BoxFit.cover,
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
