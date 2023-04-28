class Product {
  final int id;
  final String name;
  final String desc;
  final String image;
  final double price;
  final int categoryId;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
    required this.categoryId,
    this.isFavorite = false,
  });
}

final listProduct = [
  Product(
    id: 1,
    name: 'Cappuccino',
    desc:
        'A cappuccino is the perfect balance of espresso, steamed milk and foam.',
    image:
        'https://plus.unsplash.com/premium_photo-1673545518947-ddf3240090b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    price: 3.20,
    categoryId: 2,
  ),
  Product(
    id: 2,
    name: 'Americano',
    desc:
        'An Americano is made by pouring hot water over one or two espresso shots, resulting in a drink of similar volume and strength to regular coffee.',
    image:
        'https://images.unsplash.com/photo-1531835207745-506a1bc035d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    price: 2.45,
    categoryId: 3,
  ),
  Product(
    id: 3,
    name: 'Espresso',
    desc:
        'As a beverage, espresso is a concentrated form of coffee brewed with high pressure, hot water and finely ground coffee beans.',
    image:
        'https://images.unsplash.com/photo-1559496417-e7f25cb247f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
    price: 2.45,
    categoryId: 2,
  ),
  Product(
    id: 4,
    name: 'Lemon Tea',
    desc:
        'Lemon Tea is a refreshing tea where lemon juice is added in black or green tea.',
    image:
        'https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80',
    price: 1.65,
    categoryId: 4,
  ),
  Product(
    id: 5,
    name: 'Honey Tea',
    desc: 'Honey tea is tea sweetened and enriched with honey.',
    image:
        'https://images.unsplash.com/photo-1637216789852-d2c6d5de6f68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    price: 1.65,
    categoryId: 4,
  ),
];
