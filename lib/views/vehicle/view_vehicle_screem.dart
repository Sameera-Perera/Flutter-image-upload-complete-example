import 'package:flutter/material.dart';
import 'package:flutter_rest_api_image_upload/controllers/vehicleController.dart';
import 'package:flutter_rest_api_image_upload/models/vehicle.dart';
import 'package:get/get.dart';

class ViewVehicleScreen extends StatefulWidget {
  @override
  _ViewVehicleScreenState createState() => _ViewVehicleScreenState();
}

class _ViewVehicleScreenState extends State<ViewVehicleScreen> {
  final vehicleController = Get.put(VehicleController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      vehicleController.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(!vehicleController.isLoading.value)
          return ListView.builder(
            shrinkWrap: true,
            itemCount: vehicleController.vehicles.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return VehicleCard(vehicle: vehicleController.vehicles[index]);
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
    );
  }
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleCard({required this.vehicle});
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
                '${vehicle.name}',
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
                'Year',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: -0.1,
                    color: Colors.black87),
              ),
              Text(
                '${vehicle.year}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.black87,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
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
                  child: Image(
                      image: NetworkImage(vehicle.image1)
                  ),
                ),
              ),
              Container(
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
                  child: Image(
                      image: NetworkImage(vehicle.image2),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
