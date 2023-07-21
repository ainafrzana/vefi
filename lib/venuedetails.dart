import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'bookingformpage.dart';


class VenueDetails extends StatelessWidget {
  final String imagePath;

  const VenueDetails({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Venue Details'),
         iconTheme: IconThemeData(
          color: Colors.black, 
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Rooftop Garden at Colony.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Star Boulevard, KLCC',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Capacity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFFFDAA9D),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Standing - 100 guests \n Cocktail - 80 guests \n Theatre - 50 guests',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'What they offer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFFFDAA9D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.wifi),
                    SizedBox(height: 4.0),
                    Text('WiFi'),
                  ],
                ),
                SizedBox(width: 16.0),
                Column(
                  children: [
                    Icon(Icons.event_seat),
                    SizedBox(height: 4.0),
                    Text('Tables and Chairs'),
                  ],
                ),
                SizedBox(width: 16.0),
                Column(
                  children: [
                    Icon(Icons.local_dining),
                    SizedBox(height: 4.0),
                    Text('Catering'),
                  ],
                ),
                SizedBox(width: 16.0),
                Column(
                  children: [
                    Icon(Icons.videocam),
                    SizedBox(height: 4.0),
                    Text('Projector'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 1.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Where you will be',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFFFDAA9D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  onTap: () {
                    _launchMapsNavigation();
                  },
                  child: Text(
                    'View on Maps',
                    style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 200.0,
                child: FutureBuilder<Position>(
                  future: _getCurrentPosition(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final position = snapshot.data!;
                      return FlutterMap(
                        options: MapOptions(
                          center: LatLng(3.161639922953687, 101.7122164279725),
                          zoom: 13.0,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: ['a', 'b', 'c'],
                          ),
                          MarkerLayerOptions(
                            markers: [
                              Marker(
                                width: 80.0,
                                height: 80.0,
                                point: LatLng(3.161639922953687, 101.7122164279725),
                                builder: (ctx) => Container(
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10), 
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BookingFormPage(),
                      settings: RouteSettings(arguments: imagePath), // Pass the imagePath as arguments
                    ),
                  );
                },
                child: Text("BOOK NOW"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 4, 
                  primary: Color(0xFFFDAA9D), 
                  onPrimary: Colors.white, 
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), 
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Position> _getCurrentPosition() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    return Geolocator.getCurrentPosition();
  }

  void _launchMapsNavigation() async {
    final url = 'https://maps.google.com/?q=Star+Boulevard,KLCC';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
