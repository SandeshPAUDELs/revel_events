import 'package:event_app/module/domain/usecases/event_venue_details_usecases.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventVenueDetailCubit extends Cubit<EventVenueDetailsState>{
  final EventVenueDetailsUsecases eventVenueDetailsUsecases;
  EventVenueDetailCubit(this.eventVenueDetailsUsecases) : super(EventVenueDetailsInitial());

  Future<void> getEventVenueDetails() async {
    emit(EventVenueDetailsLoading());
    try {
      final eventVenueDetails = await eventVenueDetailsUsecases.getEventVenueDetails();
      emit(EventVenueDetailsLoaded(eventVenueDetails));
    } catch (e) {
      emit(EventVenueDetailsError(e.toString()));
    }
  }
}