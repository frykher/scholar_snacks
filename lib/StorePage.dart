import 'package:flutter/material.dart';
import 'package:scholar_snacks/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'PurchasePage.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key, required this.id});

  final int id;

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final supabase = Supabase.instance.client;
  late Future _future;

  @override
  void initState() {
    _future = Supabase.instance.client
        .from('store')
        .select()
        .eq('id', widget.id)
        .single();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
                    color: Color.fromRGBO(52, 25, 83, 1)));
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Jerome\'s Halal Food Items"),
            ),
            body: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PurchasePage()));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              ExactAssetImage('assets/chicken over rice.png')),
                      tileColor: Colors.grey.withOpacity(0.3),
                      title: Text('Chicken Over Rice \n \$8.00'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PurchasePage()));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              ExactAssetImage('assets/lamb over rice.png')),
                      tileColor: Colors.grey.withOpacity(0.3),
                      title: Text('Lamb Over Rice \n \$8.00'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PurchasePage()));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              ExactAssetImage('assets/mixed over rice.png')),
                      tileColor: Colors.grey.withOpacity(0.3),
                      title: Text('Mixed Over Rice \n \$8.00'),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
