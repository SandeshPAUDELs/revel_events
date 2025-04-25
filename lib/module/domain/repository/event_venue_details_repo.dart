import 'package:event_app/module/domain/entities/event_venue_detail_entity.dart';

abstract class EventVenueDetailsRepo {
  Future<List<EventVenueDetails>> getEventVenueDetails();
}