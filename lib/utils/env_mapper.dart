import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvMapper {
  static String baseUrl() {
    return DotEnv().env['BASE_URL'];
  }

  static String apiKey() {
    return DotEnv().env['API_KEY'];
  }
}
