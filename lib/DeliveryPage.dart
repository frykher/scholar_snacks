import 'package:flutter/material.dart';
import 'package:scholar_snacks/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'DeliveryConfirmation.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final _future = Supabase.instance.client.from('order').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Active Deliveries')),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
                    color: Color.fromRGBO(52, 25, 83, 1)));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('There are no active deliveries'),
            );
          }
          final orders =
              snapshot.data!.map((store) => Order.fromMap(store)).toList();
          return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                final order = orders[index];
                return ListTile(
                  leading: const Icon(Icons.list),
                  trailing: Text(
                    '\$${order.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Color.fromRGBO(52, 25, 83, 1), fontSize: 30),
                  ),
                  title: RichText(
                    text: TextSpan(
                      text: 'Jerome\'s Halal',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      children: <TextSpan>[
                        TextSpan(
                          text: tempMap[order.itemId],
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DeliveryConfirmation(order: order)));
                  },
                );
              });
        },
      ),
    );
  }
}
