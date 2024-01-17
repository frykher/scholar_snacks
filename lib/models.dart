class Store {
  final int id;
  final DateTime createdAt;
  final String name;
  final String imageUrl;
  final List<Item>? items;

  Store.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        createdAt = DateTime.parse(map['created_at']),
        imageUrl = map['image_url'],
        items = map['item']?.map<Item>((item) => Item.fromMap(item)).toList();
}

class Item {
  final int id;
  final DateTime createdAt;
  final String name;
  final double price;
  final int? calories;
  final String? imageUrl;
  final int storeId;

  Item.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        createdAt = DateTime.parse(map['created_at']),
        imageUrl = map['image_url'],
        calories = map['calories'],
        price = map['price'],
        storeId = map['store_id'];
}

class User {
  final String id;
  final String username;
  final DateTime createdAt;

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        createdAt = DateTime.parse(map['created_at']);
}

class Order {
  final int id;
  final DateTime createdAt;
  final int storeId;
  final bool completed;
  final double total;
  final String patronId;
  final String? carrierId;
  final int itemId;

  Order.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        createdAt = DateTime.parse(map['created_at']),
        storeId = map['store_id'],
        completed = map['completed'],
        total = map['total'],
        patronId = map['patron_id'],
        carrierId = map['carrier_id'],
        itemId = map['item_id'];
}

const tempMap = {
  1: 'Chicken Over Rice',
  2: 'Lamb Over Rice'
};
