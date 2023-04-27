class Category {
  final int id;
  final String title;
  bool isSelected;

  Category({
    required this.id,
    required this.title,
    this.isSelected = false,
  });
}

final listCategory = [
  Category(
    id: 1,
    title: 'All',
    isSelected: true,
  ),
  Category(
    id: 2,
    title: 'Hot Coffees',
  ),
  Category(
    id: 3,
    title: 'Iced Coffees',
  ),
  Category(
    id: 4,
    title: 'Non Coffee',
  ),
];
