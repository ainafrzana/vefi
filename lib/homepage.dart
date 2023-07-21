import 'package:flutter/material.dart';

import 'venuedetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                controller: searchController,
                style: TextStyle(
                    color: Colors.black), // Set the text color of the TextField
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(color: Colors.grey), // Set the hint text color
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,
                      color: Colors.black), // Set the icon color
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  fillColor:
                      Colors.white, // Set the background color of the TextField
                  filled:
                      true, // Ensure that the TextField is filled with the background color
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 2.0), // Set border color for normal state
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Color(0xAFE3CE),
                        width: 3.0), // Set border color for focused state
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 35.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Color(
                                0xFFFDAA9D) // Set the desired color for the selected item
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors
                                  .transparent // No border for the selected item
                              : Color(
                                  0xFFFDAA9D), // Border color for non-selected items
                          width: 2.0,
                        ),
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors
                                    .white // Set the text color for the selected item
                                : Colors
                                    .black, // Text color for non-selected items
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 8.0);
                },
                itemCount: 5,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VenueDetails(imagePath: 'images/image1.jpg'),
                          ),
                        );
                      },
                      child: VenueCard(
                        imagePath: 'images/image1.jpg',
                        distance: '100km',
                        capacity: '100pax',
                        isSelected: selectedIndex == 0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VenueDetails(imagePath: 'images/image2.jpg'),
                          ),
                        );
                      },
                      child: VenueCard(
                        imagePath: 'images/image2.jpg',
                        distance: '200km',
                        capacity: '200pax',
                        isSelected: selectedIndex == 1,
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
  final bool isSelected;

  const VenueCard({
    required this.imagePath,
    required this.distance,
    required this.capacity,
    this.isSelected = false,
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
              if (isSelected)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
