import 'package:flutter/material.dart';

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
      ]
      )
      )
      );
  }
}