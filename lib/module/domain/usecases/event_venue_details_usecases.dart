import 'package:event_app/module/domain/repository/event_venue_details_repo.dart';
import 'package:event_app/module/domain/entities/event_venue_detail_entity.dart';

class EventVenueDetailsUsecases {
  final EventVenueDetailsRepo eventVenueDetailsRepo;
  EventVenueDetailsUsecases(this.eventVenueDetailsRepo);
  Future<List<EventVenueDetails>> getEventVenueDetails() async {
    return await eventVenueDetailsRepo.getEventVenueDetails();
  }
}
