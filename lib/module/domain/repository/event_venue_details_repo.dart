import 'package:event_app/module/domain/entities/event_venue_detail_entities.dart';

abstract class EventVenueDetailsRepo {
  Future<List<EventVenueDetailsEntities>> getEventVenueDetails();
}