import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wastetastic/entity/WastePOI.dart';
import 'package:custom_info_window/custom_info_window.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'Map';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  bool changed = false;
  List<Marker> markerList = [];

  void buildMarkerList(List<WastePOI> WastePOIs) {
    for (WastePOI w in WastePOIs) {
      markerList.add(Marker(
          markerId: MarkerId(w.id),
          draggable: false,
          onTap: () {
            _customInfoWindowController.addInfoWindow(
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 15,
                            ),
//                          SizedBox(
//                            width: 8.0,
//                          ),
                            Flexible(
                              child: Text(
                                "${w.POI_name}\n${w.address}. Singapore ${w.POI_postalcode} "
                                "\nCategory: ${w.wasteCategory} \n${w.POI_description}",
                                overflow: TextOverflow.fade,
//                            style:
//                                Theme.of(context).textTheme.headline6.copyWith(
//                                      color: Colors.white,
//                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color: Colors.blue,
                      width: 20.0,
                      height: 10.0,
                    ),
                  ),
                ],
              ),
              LatLng(
                w.location.latitude,
                w.location.longitude,
              ),
            );
            print("Marker Tap");
          },
          position: LatLng(
            w.location.latitude,
            w.location.longitude,
          )));
    }
  }

  @override
  void initState() {
    super.initState();
    //UserAccountMgr.userDetails.printUserDetails();
  }

  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    final String title = args['title'];
    buildMarkerList(args['WastePOI']);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, changed);
              },
            ),
          ),
          body: Stack(children: <Widget>[
            GoogleMap(
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove();
              },
              onMapCreated: (GoogleMapController controller) async {
                _customInfoWindowController.googleMapController = controller;
              },
              initialCameraPosition:
                  CameraPosition(target: LatLng(1.3521, 103.8198), zoom: 12.0),
              markers: Set.from(markerList),
            ),
            CustomInfoWindow(
              controller: _customInfoWindowController,
              height: 75,
              width: 150,
              offset: 50,
            ),
          ])),
    );
  }
}
