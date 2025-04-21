class EventVenueDetailsEntities {
    String id;
    String image;
    // EventEntities eventEntities;
    String startDatetime;
    bool hasRegistration;
    bool fillAllParticipant;
    dynamic tableReservationUrl; // json response ma null thiyo tei bhayera dynamic rakheko
    // VenueEntities venueEntities;
    String status;
    String endDatetime;
    List<dynamic> ticketOptions;
    String termsAndCondition;
    // MetadataJsonEntities metadataJsonEntities;

    EventVenueDetailsEntities({
        required this.id,
        required this.image,
        // required this.eventEntities,
        required this.startDatetime,
        required this.hasRegistration,
        required this.fillAllParticipant,
        required this.tableReservationUrl,
        // required this.venueEntities,
        required this.status,
        required this.endDatetime,
        required this.ticketOptions,
        required this.termsAndCondition,
        // required this.metadataJsonEntities,
    });
}


class EventEntities {
    String id;
    String name;
    String about;
    String venue;
    String ageConstraint;
    DateRangeEntities dateRangeEntities;
    List<String> language;
    List<String> category;
    List<String> subcategory;
    List<String> eventType;
    List<ArtistEntities> artistsEntities;
    List<dynamic> eventContent;
    String image;
    bool isExclusive;
    int interestedCount;
    bool isInterested;
    bool isFree;
    dynamic amountRange;  // json response ma null thiyo tei bhayera dynamic rakheko
    OrganizerEntities organizerEntities;
    MetadataJsonEntities metadataJsonEntities;

    EventEntities({
        required this.id,
        required this.name,
        required this.about,
        required this.venue,
        required this.ageConstraint,
        required this.dateRangeEntities,
        required this.language,
        required this.category,
        required this.subcategory,
        required this.eventType,
        required this.artistsEntities,
        required this.eventContent,
        required this.image,
        required this.isExclusive,
        required this.interestedCount,
        required this.isInterested,
        required this.isFree,
        required this.amountRange,
        required this.organizerEntities,
        required this.metadataJsonEntities,
    });

}

class ArtistEntities {
    String id;
    String name;
    String image;

    ArtistEntities({
        required this.id,
        required this.name,
        required this.image,
    });
}

class DateRangeEntities {
    String startDatetime;
    String endDatetime;

    DateRangeEntities({
        required this.startDatetime,
        required this.endDatetime,
    });
}

class MetadataJsonEntities {
    OgEntities ogEntities;
    String title;
    List<String> keywords;
    String description;

    MetadataJsonEntities({
        required this.ogEntities,
        required this.title,
        required this.keywords,
        required this.description,
    });

}

class OgEntities {
    String url;
    String image;

    OgEntities({
        required this.url,
        required this.image,
    });

}

class OrganizerEntities {
    String id;
    String name;
    String description;
    bool isFollowed;
    String image;
    int totalFollowersCount;

    OrganizerEntities({
        required this.id,
        required this.name,
        required this.description,
        required this.isFollowed,
        required this.image,
        required this.totalFollowersCount,
    });

}

class VenueEntities {
    String id;
    String name;
    String city;
    String address;
    GeoLocationEntities geoLocationEntities;
    String googleMapUrl;

    VenueEntities({
        required this.id,
        required this.name,
        required this.city,
        required this.address,
        required this.geoLocationEntities,
        required this.googleMapUrl,
    });

}

class GeoLocationEntities {
    double latitude;
    double longitude;

    GeoLocationEntities({
        required this.latitude,
        required this.longitude,
    });

}
