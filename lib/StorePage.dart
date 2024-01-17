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
        .select('*, item(*)')
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
          print(snapshot.data);
          final store = Store.fromMap(snapshot.data);

          return Scaffold(
            appBar: AppBar(
              title: Text(store.name),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                      itemCount: store.items!.length,
                      itemBuilder: (context, index) {
                        final item = store.items![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PurchasePage(item: item, storeId: item.storeId)));
                          },
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(item.imageUrl!)),
                              tileColor: Colors.grey.withOpacity(0.3),
                              title: Text(item.name),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
