import 'package:oggetto_afisha_front/domian/categories/categories_entities.dart';

abstract class CategoriesRepository {
  Future<CategoriesList> getCategoryList();
  Future<Category> getCategoryByID(Category category);
}
