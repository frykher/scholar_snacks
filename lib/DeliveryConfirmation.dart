import 'package:flutter/material.dart';
import 'package:scholar_snacks/models.dart';
import 'DeliveryStatus.dart';

class DeliveryConfirmation extends StatefulWidget {
  final Order order;

  const DeliveryConfirmation({super.key, required this.order});

  @override
  _DeliveryConfirmationState createState() => _DeliveryConfirmationState();
}

class _DeliveryConfirmationState extends State<DeliveryConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivery Details"),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 30),
          Text('Are you sure you would like to take this order?'),
          const SizedBox(height: 30),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => DeliveryStatus(order: widget.order)),
                    (route) => false);
              },
              child: Text(
                'Accept!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ])));
  }
}
