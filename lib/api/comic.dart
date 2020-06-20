import 'package:redux_example/utils/env_mapper.dart';
import 'package:http/http.dart' as http;

class ComicApi {
  static Future<http.Response> fetchComics() async {
    String baseUrl = EnvMapper.baseUrl();
    String apiKey = EnvMapper.apiKey();
    return http.get('$baseUrl/issues/?api_key=$apiKey&format=json');
  }
}
