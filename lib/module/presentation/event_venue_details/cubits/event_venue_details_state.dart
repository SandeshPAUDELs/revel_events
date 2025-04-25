import 'package:event_app/module/domain/entities/event_venue_detail_entity.dart';

abstract class EventVenueDetailsState {}

class EventVenueDetailsInitial extends EventVenueDetailsState {}

class EventVenueDetailsLoading extends EventVenueDetailsState {}

class EventVenueDetailsLoaded extends EventVenueDetailsState {
  final List<EventVenueDetails> eventVenueDetails;
  EventVenueDetailsLoaded(this.eventVenueDetails);
}

class EventVenueDetailsError extends EventVenueDetailsState {
  final String errorMessage;
  EventVenueDetailsError(this.errorMessage);
}
