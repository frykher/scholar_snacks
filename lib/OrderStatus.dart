import 'package:flutter/material.dart';
import 'Navigation.dart';

class OrderStatus extends StatefulWidget {
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Status"),),
      body: Center(child: Column(children: [
        const SizedBox(height: 30),
        Text('Your order status is ...'),
        const SizedBox(height: 10),
        Text('Your driver is ... feet away'),
        const SizedBox(height: 10),
        Text('Your order of Chicken over rice costed \$8.00'),
        const SizedBox(height: 20),
        Container(
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Navigation()));
                },
                child: Center(
                  child: Text(
                    'I have received my order! (Click only when your order has arrived)',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
      ]
      )
      )
      );
  }
}