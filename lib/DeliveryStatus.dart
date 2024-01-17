import 'package:flutter/material.dart';
import 'package:scholar_snacks/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Navigation.dart';

class DeliveryStatus extends StatefulWidget {
  final Order order;

  const DeliveryStatus({super.key, required this.order});

  @override
  _DeliveryStatusState createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  final supabase = Supabase.instance.client;

  void onUpdate(payload) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Navigation()));
  }

  @override
  void initState() {
    supabase.from('order').update({
      'carrier_id': supabase.auth.currentUser!.id,
    }).eq('id', widget.order.id);
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
          title: Text("Delivery Status"),
        ),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 30),
          Text('You are at The Bronx High School of Science'),
          const SizedBox(height: 10),
          Text('The requested item is: ${tempMap[widget.order.itemId]}'),
          const SizedBox(height: 10),
          Text('Go to the store: Jerome\'s Halal'),
          const SizedBox(height: 10),
          Text('The total cost is \$${widget.order.total.toStringAsFixed(2)}'),
          const SizedBox(height: 20),
        ])));
  }
}
