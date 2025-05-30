import 'package:event_app/core/network/dio.dart';
import 'package:event_app/core/network/url.dart';
import 'package:event_app/module/data/even_details/models/event_venue_detail_model.dart';

abstract class EventVenueDetailsSource {
  Future<List<EventVenueDetails>> getEventVenueDetails();
}

class EventVenueDetailsDataSourceImpl extends EventVenueDetailsSource {
  final String baseUrl = ApiUrl.baseUrl;
  final DioClient dio;
  EventVenueDetailsDataSourceImpl({required this.dio});

  @override
  Future<List<EventVenueDetails>> getEventVenueDetails() async {
    try {
      final response = await dio.getRequest(path: baseUrl);
      print('Response: ${response.data}');
      if (response.data is Map<String, dynamic>) {
        return [EventVenueDetails.fromJson(response.data)];
      } else if (response.data is List) {
        return (response.data as List)
            .map((model) => EventVenueDetails.fromJson(model))
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception(e);
    }
  }

}
