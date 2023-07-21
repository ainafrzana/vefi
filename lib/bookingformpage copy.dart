import 'package:flutter/material.dart';
import 'venuedetails.dart';
import 'homepage.dart';
import 'package:intl/intl.dart';

class BookingFormPage extends StatefulWidget {
  @override
  _BookingFormPageState createState() => _BookingFormPageState();
}

class PaymentMethodWidget extends StatefulWidget {
  final String logoPath;

  PaymentMethodWidget({required this.logoPath});

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(widget.logoPath),
        ),
      ),
    );
  }
}

class _BookingFormPageState extends State<BookingFormPage> {
  // Define variables for form fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String selectedService = ''; // Variable to store the selected service

// Function to handle showing the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:
          DateTime(1900), // Set the earliest date you want to allow selection
      lastDate:
          DateTime.now(), // Set the latest date you want to allow selection
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      // If a date is selected, update the text in the TextFormField
      _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  // Implement the submit function
  void _submitForm() {
    // Add your logic to process the form data here
    // For example, you can send the data to an API or save it to a database
    // For now, we will just print the form data to the console
    print('Name: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print('Date: ${_phoneController.text}');
    // Add more fields as needed
  }

  Widget _buildServiceOption(IconData iconData, String serviceLabel) {
    return Column(
      children: [
        Icon(iconData),
        SizedBox(height: 4.0),
        Text(
          serviceLabel,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Radio<String>(
          value: serviceLabel,
          groupValue: selectedService,
          onChanged: (value) {
            setState(() {
              selectedService = value!;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the imagePath passed from the previous page
    final String imagePath =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm & Pay'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: 20.0), // Adjust the padding to create enough space
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align the containers to the top of the row
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(imagePath), // Use AssetImage here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Add some spacing between the image container and text container
                    Expanded(
                      // Use the Expanded widget to allow the text container to take the remaining space
                      child: Container(
                        height: 200,
                        child: Text(
                          'Rooftop Garden at Colony', // Replace this with your desired text
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      20), // Add spacing between the image and the form container
              //Form Container
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0xFFFDAA9D), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Your Event',
                      style: TextStyle(
                        fontSize: 20, // Set the font size to 20
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                    // Create form fields here
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _dateController,
                      readOnly: true, // Prevent manual editing
                      onTap: () =>
                          _selectDate(context), // Show the date picker on tap
                      decoration: InputDecoration(
                        labelText: 'Date',
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0xFFFDAA9D), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildServiceOption(Icons.wifi, 'WiFi'),
                        SizedBox(width: 16.0),
                        _buildServiceOption(
                            Icons.event_seat, 'Tables and Chairs'),
                        SizedBox(width: 16.0),
                        _buildServiceOption(Icons.local_dining, 'Catering'),
                        SizedBox(width: 16.0),
                        _buildServiceOption(Icons.videocam, 'Projector'),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0xFFFDAA9D), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Your Details',
                      style: TextStyle(
                        fontSize: 20, // Set the font size to 20
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                    // Create form fields here
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: 'Phone No.'),
                    ),
                    // Add more fields as needed

                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0xFFFDAA9D), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Payment Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PaymentMethodWidget(
                          logoPath: 'images/touchngo_logo.png',
                        ),
                        PaymentMethodWidget(
                          logoPath: 'images/grabpay.png.webp',
                        ),
                        PaymentMethodWidget(
                          logoPath: 'images/card_logo.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Positioned(
                left: 16, // Add left padding
                right: 16, // Add right padding
                bottom: 20, // Adjust the bottom spacing as needed
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    primary: Color(0xFFFDAA9D),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Container(
                    width: double
                        .infinity, // Make the button take the full available width
                    alignment: Alignment.center,
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
