class Item {
  final int id;
  final String name;
  final String price;
  final String url;
  final String color;

  const Item(
      {required this.id,
        required this.name,
        required this.price,
        required this.url,
        required this.color});

  Map<String, dynamic> toJson() =>
      {'id': id,'name': name, 'price': price, 'url': url, 'color': color};
}
