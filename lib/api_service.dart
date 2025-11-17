import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* idk too much about uris and parsing but i think its like a framework for getting the actual quotes
 and the */
class ApiService {
  final http.Client _client = http.Client(); //init http

  Future<T> get<T>({
    required String uri,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _client.get(Uri.parse(uri)); //the actual call
      //the shit below me is a bunch of error code possibilties
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return fromJson(json);
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e'); //get a load of this guy
    }
  }
}

final apiServiceProvider = Provider(
  (ref) => ApiService(),
); //creates an ApiService whenever apiServiceProvider is needed
