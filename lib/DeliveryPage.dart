import 'package:flutter/material.dart';
import 'DeliveryConfirmation.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Delivery Page')),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.list),
              trailing: const Text(
                '\$8.00',
                style: TextStyle(
                    color: Color.fromRGBO(52, 25, 83, 1), fontSize: 30),
              ),
              title: RichText(
                text: TextSpan(
                  text: "Jerome\'s Halal ",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Chicken Over Rice',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    TextSpan(
                      text: '\nPepsi',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DeliveryConfirmation()));
              },
            );
          }),
    );
  }
}
