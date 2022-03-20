import 'dart:convert';

class ApiCategoriesList {
  final List<ApiCategory> subscribed;
  final List<ApiCategory> other;
  ApiCategoriesList({
    required this.subscribed,
    required this.other,
  });

  Map<String, dynamic> toMap() {
    return {
      'subscribed': subscribed.map((x) => x.toMap()).toList(),
      'other': other.map((x) => x.toMap()).toList(),
    };
  }

  factory ApiCategoriesList.fromMap(Map<String, dynamic> map) {
    return ApiCategoriesList(
      subscribed: List<ApiCategory>.from(
        map['subscribed'].map((x) => ApiCategory.fromMap(x)),
      ),
      other: List<ApiCategory>.from(
        map['other'].map((x) => ApiCategory.fromMap(x)),
      ),
    );
  }

  factory ApiCategoriesList.fromJson(String source) =>
      ApiCategoriesList.fromMap(json.decode(source));
}

class ApiCategory {
  final int id;
  final String name;
  final String iconUrl;
  ApiCategory({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'iconUrl': iconUrl,
    };
  }

  factory ApiCategory.fromMap(Map<String, dynamic> map) {
    return ApiCategory(
      id: map['id'].toInt(),
      name: map['name'],
      iconUrl: map['iconUrl'],
    );
  }
}
