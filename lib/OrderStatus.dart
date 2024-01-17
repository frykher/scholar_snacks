import 'package:flutter/material.dart';
import 'package:scholar_snacks/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Navigation.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key, required this.order, required this.item});

  final Order order;
  final Item item;

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  final supabase = Supabase.instance.client;
  bool _deliveryGuy = false;

  void onUpdate(payload) {
    print(payload);
    setState(() {
      _deliveryGuy = true;
    });
  }

  void onBroadcast(payload) {
    print(payload);
  }

  @override
  void initState() {
    print(widget.order.id);
    supabase
        .channel('order')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            callback: onUpdate,
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'id',
              value: widget.order.id,
            ))
        .subscribe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order Status"),
        ),
        body: !_deliveryGuy
            ? Center(
                child: Text(
                    'Please wait for a delivery person to claim your order'))
            : Center(
                child: Column(children: [
                const SizedBox(height: 30),
                const Text('Your order is IN PROGRESS'),
                const SizedBox(height: 10),
                const Text('Your driver is ... feet away'),
                const SizedBox(height: 10),
                Text('Your order of ${widget.item.name} costed \$${widget.order.total.toStringAsFixed(2)}'),
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        final data = await supabase
                            .from('order')
                            .update({'completed': true})
                            .eq('id', widget.order.id)
                            .select();
                        print(data);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => Navigation()));
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())));
                      }
                    },
                    child: Center(
                      child: Text(
                        'I have received my order! (Click only when your order has arrived)',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ])));
  }
}
