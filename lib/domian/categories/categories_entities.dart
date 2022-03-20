class CategoriesList {
  final List<Category> subscribed;
  final List<Category> other;
  CategoriesList({
    required this.subscribed,
    required this.other,
  });
}

class Category {
  final int id;
  final String name;
  final String iconUrl;
  Category({
    required this.id,
    required this.name,
    required this.iconUrl,
  });
}
