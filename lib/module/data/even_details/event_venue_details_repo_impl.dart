import 'package:event_app/module/data/even_details/datasource/event_venue_details_source.dart';
import 'package:event_app/module/domain/repository/event_venue_details_repo.dart';
import 'package:event_app/module/domain/entities/event_venue_detail_entity.dart';

class EventVenueDetailsRepoImpl extends EventVenueDetailsRepo {
  final EventVenueDetailsSource datasource;
  EventVenueDetailsRepoImpl({required this.datasource});

  @override
  Future<List<EventVenueDetails>> getEventVenueDetails() async {
    final eventVenueDetails = await datasource.getEventVenueDetails();
    return eventVenueDetails
        .map(
          (prop) => EventVenueDetails(
            id: prop.id,
            image: prop.image,

            event: Event(
              id: prop.event?.id,
              name: prop.event?.name,
              about: prop.event?.about,
              organizer:
                  prop.event?.organizer != null
                      ? Organizer(
                        id: prop.event!.organizer!.id,
                        name: prop.event!.organizer!.name,
                        description: prop.event!.organizer!.description,
                        isFollowed: prop.event!.organizer!.isFollowed,
                        image: prop.event!.organizer!.image,
                        totalFollowersCount:
                            prop.event!.organizer!.totalFollowersCount,
                      )
                      : null,
                metadata_json: prop.event?.metadata_json != null
                  ? MetaDataJson(
                    og: prop.event?.metadata_json?.og != null
                      ? Og(
                        url: prop.event!.metadata_json!.og!.url,
                        image: prop.event!.metadata_json!.og!.image,
                      )
                      : null,
                    title: prop.event!.metadata_json!.title,
                    keywords: prop.event!.metadata_json!.keywords != null
                      ? List<String>.from(prop.event!.metadata_json!.keywords!)
                      : null,
                    description: prop.event!.metadata_json!.description,
                  )
                  : null,
              event_type: prop.event?.event_type,
              date_range: prop.event?.date_range,
              age_constraint: prop.event?.age_constraint,
              language: prop.event?.language,
              artists:
                  prop.event?.artists != null
                      ? prop.event!.artists!
                          .map(
                            (artist) => Artist(
                              id: artist.id,
                              name: artist.name,
                              image: artist.image,
                            ),
                          )
                          .toList()
                      : null,
              category: prop.event?.category,
              subcategory: prop.event?.subcategory,
              amount_range:
                  prop.event?.amount_range != null
                      ? AmountRange(
                        highest_amount:
                            prop.event!.amount_range!.highest_amount,
                        lowest_amount: prop.event!.amount_range!.lowest_amount,
                      )
                      : null,
            ),
            terms_and_condition: prop.terms_and_condition,
            venue: Venue(
              id: prop.venue!.id,
              name: prop.venue!.name,
              address: prop.venue!.address,
              city: prop.venue!.city,
              geolocation:
                  prop.venue!.geolocation != null
                      ? Geolocation(
                        latitude: prop.venue!.geolocation!.latitude,
                        longitude: prop.venue!.geolocation!.longitude,
                      )
                      : null,
              google_map_url: prop.venue!.google_map_url,
              // googleMapUrl: prop.venue!.googleMapUrl,
            ),
            start_datetime: prop.start_datetime,
            ticket_options:
                prop.ticket_options
                    ?.map(
                      (ticketOption) => TicketOptions(
                        id: ticketOption.id,
                        name: ticketOption.name,
                        description: ticketOption.description,
                        tag: ticketOption.tag,
                        status: ticketOption.status,
                        amount: ticketOption.amount,
                        amount_type: ticketOption.amount_type,
                        number_of_participant:
                            ticketOption.number_of_participant,
                        number_of_free_participant:
                            ticketOption.number_of_free_participant,
                        app_amount: ticketOption.app_amount,
                        sales_start_datetime: ticketOption.sales_start_datetime,
                        sales_end_datetime: ticketOption.sales_end_datetime,
                      ),
                    )
                    .toList(),
          ),
        )
        .toList();
  }
}
