import 'package:flutter/material.dart';
import 'package:scholar_snacks/StorePage.dart';
import 'package:scholar_snacks/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int currentIndex = 0;
  bool isDark = false;
  final _future = Supabase.instance.client.from('store').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Order Page')),
      ),
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                      color: Color.fromRGBO(52, 25, 83, 1)));
            }
            final stores =
                snapshot.data!.map((store) => Store.fromMap(store)).toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SearchAnchor(
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                        trailing: <Widget>[],
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(1, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: stores.length,
                        itemBuilder: ((context, index) {
                          final store = stores[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => StorePage()));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage: ExactAssetImage(
                                          'assets/jeromes.png')),
                                  tileColor: Colors.grey.withOpacity(0.3),
                                  title: Text(store.name),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
