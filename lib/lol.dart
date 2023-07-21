import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payment Details'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
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
                    paymentText: 'Pay with TouchNGo',
                  ),
                  PaymentMethodWidget(
                    logoPath: 'images/grabpay_logo.png',
                    paymentText: 'Pay with GrabPay',
                  ),
                  PaymentMethodWidget(
                    logoPath: 'images/card_logo.png',
                    paymentText: 'Pay with Credit/Debit Card',
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodWidget extends StatefulWidget {
  final String logoPath;
  final String paymentText;

  PaymentMethodWidget({required this.logoPath, required this.paymentText});

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
      child: Column(
        children: [
          Container(
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
          SizedBox(height: 5),
          Text(
            widget.paymentText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
