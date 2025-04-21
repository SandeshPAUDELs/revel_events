import 'package:dio/dio.dart';
import 'package:event_app/module/data/datasource/url.dart';
import 'package:event_app/module/data/models/event_venue_detail_models.dart';

abstract class EventVenueDetailsSource {
  Future<List<EventVenueDetailsModels>> getEventVenueDetails();
}

class EventVenueDetailsDataSourceImpl extends EventVenueDetailsSource {
  final String baseUrl = ApiUrl.baseUrl;
  final Dio dio;
  EventVenueDetailsDataSourceImpl({required this.dio});

  @override
Future<List<EventVenueDetailsModels>> getEventVenueDetails() async {
  try {
    final response = await dio.get(baseUrl);
    print('Response: ${response.data}');
        if (response.data is Map<String, dynamic>) {
      return [EventVenueDetailsModels.fromJson(response.data)];
    } 
    else if (response.data is List) {
      return (response.data as List)
          .map((model) => EventVenueDetailsModels.fromJson(model))
          .toList();
    } 
    else {
      throw Exception('Unexpected response format');
    }
  } catch (e) {
    print('Error fetching data: $e');
    throw Exception(e);
  }
}
}
