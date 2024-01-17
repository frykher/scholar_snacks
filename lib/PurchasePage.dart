import 'package:flutter/material.dart';
import 'package:scholar_snacks/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'OrderStatus.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key, required this.item, required this.storeId});

  final Item item;
  final int storeId;

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final supabase = Supabase.instance.client;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 30),
          Text('Are you sure you would like to purchase this?'),
          const SizedBox(height: 30),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                try {
                  final data = await supabase
                      .from('order')
                      .insert({
                        'store_id': widget.storeId,
                        'total': widget.item.price,
                        'patron_id': supabase.auth.currentUser!.id,
                        'item_id': widget.item.id,
                      })
                      .select()
                      .single();
                  final order = Order.fromMap(data);

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => OrderStatus(order: order, item: widget.item)),
                      (route) => false);
                } catch (error) {
                  print(error);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.toString())));
                }
              },
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Color.fromRGBO(52, 25, 83, 1))
                  : Text(
                      'Purchase!',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
            ),
          ),
        ])));
  }
}
