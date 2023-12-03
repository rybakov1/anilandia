import 'dart:convert';
import 'package:anilandia/models/anime_full_model.dart';
import 'package:http/http.dart' as http;
import 'package:anilandia/models/anime_model.dart';

class AnimeApi {
  Future<List<AnimeSearchModel>> getAnimeList(params) async {
    final http.Response response =
        await http.get(Uri.http('185.248.101.68:8003', '/api/anime', params));

    if (response.statusCode == 200) {
      List<AnimeSearchModel> list = List<AnimeSearchModel>.from(json
          .decode(utf8.decode(response.bodyBytes))
          .map((data) => AnimeSearchModel.fromJson(data)));
      return list;
    } else {
      throw Exception('Failed to load anime');
    }
  }
  Future<AnimeFull> getAnimeById(id) async {
    final http.Response response =
    await http.get(Uri.parse('http://185.248.101.68:8003/api/anime/$id'));

    if (response.statusCode == 200) {
      return AnimeFull.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load anime');
    }
  }
}
