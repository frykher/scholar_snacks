import 'package:flutter/material.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Center(child: Column(children: [
        const SizedBox(height: 30),
        Text('Are you sure you would like to purchase this?'),
        const SizedBox(height: 30),
        Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  null;
                },
                child: Text(
                  'Purchase!',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
      ]
      )
      )
    );
  }
}