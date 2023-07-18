// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   final TextEditingController searchController = TextEditingController();

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Container(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           SizedBox(height: 20.0), // Added SizedBox widget
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: TextField(
              
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 border: InputBorder.none,
//                 prefixIcon: Icon(Icons.search),
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.0), // Added SizedBox widget
//           SizedBox(
//             height: 35.0, // Adjust the height of the ListView as per your requirement
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: 100.0, // Adjust the width of each item as per your requirement
//                   decoration: BoxDecoration(
//                     color: Color(0xFFFDAA9D), // Set the desired color for the item
//                     borderRadius: BorderRadius.circular(20.0), // Add circular border
//                   ),
//                   margin: EdgeInsets.only(right: 10.0), // Adjust the spacing between items
//                   child: Center(
//                     child: Text(
//                       'Item $index',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox(width: 8.0); // Adjust the spacing between items
//               },
//               itemCount: 5, // Set the number of items in the ListView
//             ),
//           ),
//           SizedBox(height: 20.0), // Added SizedBox widget
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Text('Venue 1', 
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                   ),
//                 ), 
//                 Stack(
//                   children: [
//                     Card(
//                       clipBehavior: Clip.hardEdge,
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           debugPrint('Card 1 tapped.');
//                         },
//                         child: SizedBox(
//                           width: 375,
//                           height: 170,
//                           child: Image.asset(
//                               'images/image1.jpg',
//                               fit: BoxFit.cover,
//                           ), 
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 15,
//                       left: 15,
//                       child: Container(
//                         width: 77,
//                         height: 25,
//                         decoration: BoxDecoration(
//                           color: Color(0xAFE3CE).withOpacity(1.0), 
//                           borderRadius: BorderRadius.circular(20.0), 
//                           ),
//                           child: Center(child: Text('100km'),)
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 15,
//                       right: 15,
//                       child: Container(
//                         width: 77,
//                         height: 25,
//                         decoration: BoxDecoration(
//                           color: Color(0xAFE3CE).withOpacity(1.0), 
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                           child: Center(child: Text('100pax'),)
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text('Venue 2', 
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                   ),
//                 ), 
//                 Stack(
//                   children: [
//                     Card(
//                       clipBehavior: Clip.hardEdge,
//                       child: InkWell(
//                         splashColor: Colors.blue.withAlpha(30),
//                         onTap: () {
//                           debugPrint('Card 1 tapped.');
//                         },
//                         child: SizedBox(
//                           width: 375,
//                           height: 170,
//                           child: Image.asset(
//                               'images/image2.jpg',
//                               fit: BoxFit.cover,
//                           ), 
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 15,
//                       left: 15,
//                       child: Container(
//                         width: 77,
//                         height: 25,
//                         decoration: BoxDecoration(
//                           color: Color(0xAFE3CE).withOpacity(1.0), 
//                           borderRadius: BorderRadius.circular(20.0), 
//                           ),
//                           child: Center(child: Text('100km'),)
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 15,
//                       right: 15,
//                       child: Container(
//                         width: 77,
//                         height: 25,
//                         decoration: BoxDecoration(
//                           color: Color(0xAFE3CE).withOpacity(1.0), 
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                           child: Center(child: Text('100pax'),)
//                       ),
//                     ),
//                   ],
//                 ),

//               ],
//             ),
//           )
//         ],
//       ),
      
//     ),
//   );
// }
// }


import 'package:flutter/material.dart';
import 'venuedetails.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20.0), // Added SizedBox widget
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                ),
              ),
            ),
            SizedBox(height: 20.0), // Added SizedBox widget
            SizedBox(
              height: 35.0, // Adjust the height of the ListView as per your requirement
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.0, // Adjust the width of each item as per your requirement
                    decoration: BoxDecoration(
                      color: Color(0xFFFDAA9D), // Set the desired color for the item
                      borderRadius: BorderRadius.circular(20.0), // Add circular border
                    ),
                    margin: EdgeInsets.only(right: 10.0), // Adjust the spacing between items
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 8.0); // Adjust the spacing between items
                },
                itemCount: 5, // Set the number of items in the ListView
              ),
            ),
            SizedBox(height: 20.0), // Added SizedBox widget
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VenueDetails(imagePath: 'images/image1.jpg'),
                          ),
                        );
                      },
                      child: VenueCard(
                        imagePath: 'images/image1.jpg',
                        distance: '100km',
                        capacity: '100pax',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VenueDetails(imagePath: 'images/image2.jpg'),
                          ),
                        );
                      },
                      child: VenueCard(
                        imagePath: 'images/image2.jpg',
                        distance: '200km',
                        capacity: '200pax',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VenueCard extends StatelessWidget {
  final String imagePath;
  final String distance;
  final String capacity;

  const VenueCard({
    required this.imagePath,
    required this.distance,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Text(
          'Venue',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VenueDetails(imagePath: imagePath),
              ),
            );
          },
          child: Stack(
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: 375,
                  height: 170,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: Container(
                  width: 77,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xAFE3CE).withOpacity(1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(child: Text(distance)),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  width: 77,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xAFE3CE).withOpacity(1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(child: Text(capacity)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
