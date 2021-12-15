import 'dart:convert';

import 'package:best_architecture_challenge/src/model/post.dart';
import 'package:http/http.dart' as http;

class RestProvider {
  final http.Client _httpClient;
  RestProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Post>> getPostList() async {
    var uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    final response = await _httpClient.get(uri);
    return List<Post>.from(json.decode(response.body).map((c) => Post.fromJson(c)).toList());

  }
}
