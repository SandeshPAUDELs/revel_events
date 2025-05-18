import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  static String mainUrl = dotenv.env['BASE_URl'] ?? '';
  static String versions = dotenv.env['API_VERSION'] ?? '';
  static  String baseUrl = '$mainUrl$versions/86bf0df3-e8bc-4055-9874-5e65df93e66f/event-venue-detail';
}