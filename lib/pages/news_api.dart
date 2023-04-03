import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_bfa/pages/model.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri uri = Uri.parse(
      "https://api.npoint.io/e71e9023060ac16743ea");

  final response = await http.get(uri);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List _articalsList = map['articles'];

    List<NewsApiModel> newsList = _articalsList
        .map((jsonData) => NewsApiModel.fromJson(jsonData))
        .toList();

    print(_articalsList);

    return newsList;
  } else {
    print("error");
    return [];
  }
}