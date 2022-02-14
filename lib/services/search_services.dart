import 'dart:convert';
import 'dart:developer';

import 'package:apple_music_clone/model/search_result.dart';
import 'package:dio/dio.dart';

class SearchServices {
  static const String _searchUrl = "https://itunes.apple.com/search";

  static Future<SearchResult> search(String term) async {
    String _param = term.split(" ").join("+");
    String _url = "$_searchUrl?term=$_param&country=HK&media=music";
    log(_url);
    try {
      Response _response = await Dio().get(_url);
      SearchResult _searchResult =
          SearchResult.fromJson(const JsonDecoder().convert(_response.data));
      log(_searchResult.toJson().toString());
      return _searchResult;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
