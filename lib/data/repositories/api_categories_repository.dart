import 'dart:convert';

import 'package:oggetto_afisha_front/data/api/categories_list.dart';
import 'package:oggetto_afisha_front/data/api/service.dart';
import 'package:oggetto_afisha_front/domian/categories/categories_entities.dart';
import 'package:oggetto_afisha_front/domian/categories/categories_repository.dart';

import 'package:http/http.dart' as http;

class ApiCategoriesRepository extends CategoriesRepository {
  List<Category> _addCategory(List<ApiCategory> catigoriesList) {
    final List<Category> _local = [];
    for (final _item in catigoriesList) {
      _local.add(
        Category(id: _item.id, name: _item.name, iconUrl: _item.iconUrl),
      );
    }

    return _local;
  }

  @override
  Future<CategoriesList> getCategoryList() async {
    final _response = await getDataFromAPI('/channel/list', '');
    final _decodeJson = ApiCategoriesList.fromJson(jsonDecode(_response.body));

    return CategoriesList(
      subscribed: _addCategory(_decodeJson.subscribed),
      other: _addCategory(_decodeJson.other),
    );
  }

  @override
  Future<Category> getCategoryByID(Category category) async {
    final _response =
        await getDataFromAPI('/channel/lisr', '?id=${category.id}');
    throw UnimplementedError();
  }
}
