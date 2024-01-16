class Store {
  Store({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.imageUrl,
  });

  final int id;
  final DateTime createdAt;
  final String name;
  final String imageUrl;

  Store.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        createdAt = DateTime.parse(map['created_at']),
        imageUrl = map['image_url'];
}

class User {
  User({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  final String id;
  final String username;
  final DateTime createdAt;

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        createdAt = DateTime.parse(map['created_at']);
}
