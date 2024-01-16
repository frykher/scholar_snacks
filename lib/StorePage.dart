import 'package:flutter/material.dart';
import 'PurchasePage.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jerome\'s Halal Food Items"),
      ), 
      body:
        Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PurchasePage()));
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/chicken over rice.png')
                ),
                tileColor: Colors.grey.withOpacity(0.3),
                title: Text('Chicken Over Rice \n \$8.00'),
              ),
            ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PurchasePage()));
                },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/lamb over rice.png')
                ),
                tileColor: Colors.grey.withOpacity(0.3),
                title: Text('Lamb Over Rice \n \$8.00'),
              ),
            ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PurchasePage()));
              },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/mixed over rice.png')
                ),
                tileColor: Colors.grey.withOpacity(0.3),
                title: Text('Mixed Over Rice \n \$8.00'),
              ),
            ),
            ),
          ],
        ),
    );
  }
}