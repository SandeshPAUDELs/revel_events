import 'package:event_app/module/domain/entities/event_venue_detail_entities.dart';
import 'package:event_app/module/domain/repository/event_venue_details_repo.dart';

class EventVenueDetailsUsecases {
  final EventVenueDetailsRepo eventVenueDetailsRepo;
  EventVenueDetailsUsecases(this.eventVenueDetailsRepo);

  Future<List<EventVenueDetailsEntities>> getEventVenueDetails() async {
    return await eventVenueDetailsRepo.getEventVenueDetails();
  }
}
