import 'package:flutter/material.dart';
import 'Navigation.dart';

class DeliveryStatus extends StatefulWidget {
  @override
  _DeliveryStatusState createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivery Status"),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 30),
          Text('You are at 1911 Harrison Ave'),
          const SizedBox(height: 10),
          Text('The requested items are Chicken Over Rice and a Pepsi'),
          const SizedBox(height: 10),
          Text('The total cost is \$8.00'),
          const SizedBox(height: 20),
          Container(
            height: 100,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Navigation()));
              },
              child: Center(
                child: Text(
                  'I have delivered the order! (Click only when you delivered the order)',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
        ])));
  }
}
