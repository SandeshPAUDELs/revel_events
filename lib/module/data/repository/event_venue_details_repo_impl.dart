import 'package:event_app/module/data/datasource/event_venue_details_source.dart';
import 'package:event_app/module/domain/entities/event_venue_detail_entities.dart';
import 'package:event_app/module/domain/repository/event_venue_details_repo.dart';

class EventVenueDetailsRepoImpl extends EventVenueDetailsRepo {
  final EventVenueDetailsSource datasource;
  EventVenueDetailsRepoImpl({required this.datasource});

  @override
  Future<List<EventVenueDetailsEntities>> getEventVenueDetails() async {
    final eventVenueDetails = await datasource.getEventVenueDetails();
    return eventVenueDetails
        .map(
          (prop) => EventVenueDetailsEntities(
            id: prop.id,
            image: prop.image,
           
            // eventEntities: EventEntities(
            //   id: prop.eventModels!.id,
            //   name: prop.eventModels!.name,
            //   about: prop.eventModels!.about,
            //   venue: prop.eventModels!.venue,
            //   ageConstraint: prop.eventModels!.ageConstraint,
            //   dateRangeEntities: DateRangeEntities(
            //     startDatetime: prop.eventModels!.dateRangeModels!.startDatetime,
            //     endDatetime: prop.eventModels!.dateRangeModels!.endDatetime,
            //   ),
            //   language: prop.eventModels!.language,
            //   category: prop.eventModels!.category,
            //   subcategory: prop.eventModels!.subcategory,
            //   eventType: prop.eventModels!.eventType,
            //   artistsEntities: prop.eventModels!.artistsModels
            //       .map((artist) => ArtistEntities(
            //             id: artist.id,
            //             name: artist.name,
            //             image: artist.image,
            //           ))
            //       .toList(),
            //   eventContent: prop.eventModels!.eventContent,
            //   image: prop.eventModels!.image,
            //   isExclusive: prop.eventModels!.isExclusive,
            //   interestedCount: prop.eventModels!.interestedCount,
            //   isInterested: prop.eventModels!.isInterested,
            //   isFree: prop.eventModels!.isFree,
            //   amountRange: prop.eventModels!.amountRange,
            //   organizerEntities: OrganizerEntities(
            //     id: prop.eventModels!.organizerModels!.id,
            //     name: prop.eventModels!.organizerModels!.name,
            //     description: prop.eventModels!.organizerModels!.description,
            //     isFollowed: prop.eventModels!.organizerModels!.isFollowed,
            //     image: prop.eventModels!.organizerModels!.image,
            //     totalFollowersCount: prop.eventModels!.organizerModels!.totalFollowersCount,
            //   ),
            //   metadataJsonEntities: MetadataJsonEntities(
            //     ogEntities: OgEntities(
            //       url: prop.eventModels!.metadataJsonModels!.ogModels.url,
            //       image: prop.eventModels!.metadataJsonModels!.ogModels.image,
            //     ),
            //     title: prop.eventModels!.metadataJsonModels!.title,
            //     keywords: prop.eventModels!.metadataJsonModels!.keywords,
            //     description: prop.eventModels!.metadataJsonModels!.description,
            //   ),
            // ),
            startDatetime: prop.startDatetime,
            hasRegistration: prop.hasRegistration,
            fillAllParticipant: prop.fillAllParticipant,
            tableReservationUrl: prop.tableReservationUrl,

            // venueEntities: VenueEntities(
            //   id: prop.venueModels!.id,
            //   name: prop.venueModels!.name,
            //   city: prop.venueModels!.city,
            //   address: prop.venueModels!.address,
            //   geoLocationEntities: GeoLocationEntities(
            //     latitude: prop.venueModels!.geoLocationModels.latitude,
            //     longitude: prop.venueModels!.geoLocationModels.longitude,
            //   ),
            //   googleMapUrl: prop.venueModels!.googleMapUrl,
            // ),
            status: prop.status,
            endDatetime: prop.endDatetime,
            ticketOptions: prop.ticketOptions,
            termsAndCondition: prop.termsAndCondition,

            // metadataJsonEntities: MetadataJsonEntities(
            //   ogEntities: OgEntities(
            //     url: prop.metadataJsonModels!.ogModels.url,
            //     image: prop.metadataJsonModels!.ogModels.image,
            //   ),
            //   title: prop.metadataJsonModels!.title,
            //   keywords: prop.metadataJsonModels!.keywords,
            //   description: prop.metadataJsonModels!.description,
            // ),
          ),
        )
        .toList();
  }
}
