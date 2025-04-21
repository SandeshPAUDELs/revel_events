class EventVenueDetailsModels {
  String id;
  String image;
  EventModels? eventModels;
  String startDatetime;
  bool hasRegistration;
  bool fillAllParticipant;
  dynamic tableReservationUrl;
  VenueModels? venueModels;
  String status;
  String endDatetime;
  List<dynamic> ticketOptions;
  String termsAndCondition;
  MetadataJsonModels? metadataJsonModels;

  EventVenueDetailsModels({
    required this.id,
    required this.image,
    required this.eventModels,
    required this.startDatetime,
    required this.hasRegistration,
    required this.fillAllParticipant,
    required this.tableReservationUrl,
    required this.venueModels,
    required this.status,
    required this.endDatetime,
    required this.ticketOptions,
    required this.termsAndCondition,
    required this.metadataJsonModels,
  });

  factory EventVenueDetailsModels.fromJson(Map<String, dynamic> json) {
    return EventVenueDetailsModels(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      eventModels: json['eventModels'] != null
          ? EventModels.fromJson(json['eventModels'] as Map<String, dynamic>)
          : null,
      startDatetime: json['startDatetime'] ?? '',
      hasRegistration: json['hasRegistration'] ?? false,
      fillAllParticipant: json['fillAllParticipant'] ?? false,
      tableReservationUrl: json['tableReservationUrl'],
      venueModels: json['venueModels'] != null
          ? VenueModels.fromJson(json['venueModels'] as Map<String, dynamic>)
          : null,
      status: json['status'] ?? '',
      endDatetime: json['endDatetime'] ?? '',
      ticketOptions: (json['ticketOptions'] ?? []) as List<dynamic>,
      termsAndCondition: json['termsAndCondition'] ?? '',
      metadataJsonModels: json['metadataJsonModels'] != null
          ? MetadataJsonModels.fromJson(json['metadataJsonModels'] as Map<String, dynamic>)
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'eventModels': eventModels?.toJson(),
      'startDatetime': startDatetime,
      'hasRegistration': hasRegistration,
      'fillAllParticipant': fillAllParticipant,
      'tableReservationUrl': tableReservationUrl,
      'venueModels': venueModels?.toJson(),
      'status': status,
      'endDatetime': endDatetime,
      'ticketOptions': ticketOptions,
      'termsAndCondition': termsAndCondition,
      'metadataJsonModels': metadataJsonModels?.toJson(),
    };
  }
}

class EventModels {
  String id;
  String name;
  String about;
  String venue;
  String ageConstraint;
  DateRangeModels? dateRangeModels;
  List<String> language;
  List<String> category;
  List<String> subcategory;
  List<String> eventType;
  List<ArtistModels> artistsModels;
  List<dynamic> eventContent;
  String image;
  bool isExclusive;
  int interestedCount;
  bool isInterested;
  bool isFree;
  dynamic amountRange;
  OrganizerModels? organizerModels;
  MetadataJsonModels? metadataJsonModels;

  EventModels({
    required this.id,
    required this.name,
    required this.about,
    required this.venue,
    required this.ageConstraint,
    required this.dateRangeModels,
    required this.language,
    required this.category,
    required this.subcategory,
    required this.eventType,
    required this.artistsModels,
    required this.eventContent,
    required this.image,
    required this.isExclusive,
    required this.interestedCount,
    required this.isInterested,
    required this.isFree,
    required this.amountRange,
    required this.organizerModels,
    required this.metadataJsonModels,
  });

  factory EventModels.fromJson(Map<String, dynamic> json) {
    return EventModels(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      about: json['about'] ?? '',
      venue: json['venue'] ?? '',
      ageConstraint: json['ageConstraint'] ?? '',
      dateRangeModels: json['dateRangeModels'] != null
          ? DateRangeModels.fromJson(json['dateRangeModels'] as Map<String, dynamic>)
          : null,
      language: (json['language'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      category: (json['category'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      subcategory: (json['subcategory'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      eventType: (json['eventType'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      artistsModels: (json['artistsModels'] as List<dynamic>?)
              ?.map((e) => ArtistModels.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      eventContent: json['eventContent'] ?? [],
      image: json['image'] ?? '',
      isExclusive: json['isExclusive'] ?? false,
      interestedCount: json['interestedCount'] ?? 0,
      isInterested: json['isInterested'] ?? false,
      isFree: json['isFree'] ?? false,
      amountRange: json['amountRange'],
      organizerModels: json['organizerModels'] != null
          ? OrganizerModels.fromJson(json['organizerModels'] as Map<String, dynamic>)
          : null,
      metadataJsonModels: json['metadataJsonModels'] != null
          ? MetadataJsonModels.fromJson(json['metadataJsonModels'] as Map<String, dynamic>)
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'venue': venue,
      'ageConstraint': ageConstraint,
      'dateRangeModels': dateRangeModels?.toJson(),
      'language': language,
      'category': category,
      'subcategory': subcategory,
      'eventType': eventType,
      'artistsModels': artistsModels.map((e) => e.toJson()).toList(),
      'eventContent': eventContent,
      'image': image,
      'isExclusive': isExclusive,
      'interestedCount': interestedCount,
      'isInterested': isInterested,
      'isFree': isFree,
      'amountRange': amountRange,
      'organizerModels': organizerModels?.toJson(),
      'metadataJsonModels': metadataJsonModels?.toJson(),
    };
  }
}

class ArtistModels {
  String id;
  String name;
  String image;

  ArtistModels({required this.id, required this.name, required this.image});

  factory ArtistModels.fromJson(Map<String, dynamic> json) {
    return ArtistModels(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
    
  }
}
class DateRangeModels {
  String startDatetime;
  String endDatetime;

  DateRangeModels({required this.startDatetime, required this.endDatetime});

  factory DateRangeModels.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return DateRangeModels(startDatetime: '', endDatetime: '');
    }
    return DateRangeModels(
      startDatetime: json['startDatetime'] as String? ?? '',
      endDatetime: json['endDatetime'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDatetime': startDatetime,
      'endDatetime': endDatetime,
    };
  }
}

class MetadataJsonModels {
  OgModels ogModels;
  String title;
  List<String> keywords;
  String description;

  MetadataJsonModels({
    required this.ogModels,
    required this.title,
    required this.keywords,
    required this.description,
  });

  factory MetadataJsonModels.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return MetadataJsonModels(
        ogModels: OgModels(url: '', image: ''),
        title: '',
        keywords: [],
        description: '',
      );
    }
    return MetadataJsonModels(
      ogModels: OgModels.fromJson(json['ogModels'] as Map<String, dynamic>?),
      title: json['title'] as String? ?? '',
      keywords: (json['keywords'] as List<dynamic>?)?.cast<String>() ?? [],
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ogModels': ogModels.toJson(),
      'title': title,
      'keywords': keywords,
      'description': description,
    };
  }
}

class OgModels {
  String url;
  String image;

  OgModels({required this.url, required this.image});

  factory OgModels.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return OgModels(url: '', image: '');
    }
    return OgModels(
      url: json['url'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'image': image,
    };
  }
}

class OrganizerModels {
  String id;
  String name;
  String description;
  bool isFollowed;
  String image;
  int totalFollowersCount;

  OrganizerModels({
    required this.id,
    required this.name,
    required this.description,
    required this.isFollowed,
    required this.image,
    required this.totalFollowersCount,
  });

  factory OrganizerModels.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return OrganizerModels(
        id: '',
        name: '',
        description: '',
        isFollowed: false,
        image: '',
        totalFollowersCount: 0,
      );
    }
    return OrganizerModels(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isFollowed: json['isFollowed'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      totalFollowersCount: json['totalFollowersCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isFollowed': isFollowed,
      'image': image,
      'totalFollowersCount': totalFollowersCount,
    };
  }
}

class VenueModels {
  String id;
  String name;
  String city;
  String address;
  GeoLocationModels geoLocationModels;
  String googleMapUrl;

  VenueModels({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.geoLocationModels,
    required this.googleMapUrl,
  });

  factory VenueModels.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return VenueModels(
        id: '',
        name: '',
        city: '',
        address: '',
        geoLocationModels: GeoLocationModels(latitude: 0.0, longitude: 0.0),
        googleMapUrl: '',
      );
    }
    return VenueModels(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      city: json['city'] as String? ?? '',
      address: json['address'] as String? ?? '',
      geoLocationModels: GeoLocationModels.fromJson(
        json['geoLocationModels'] as Map<String, dynamic>?,
      ),
      googleMapUrl: json['googleMapUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'address': address,
      'geoLocationModels': geoLocationModels.toJson(),
      'googleMapUrl': googleMapUrl,
    };
  }
}

class GeoLocationModels {
  double latitude;
  double longitude;

  GeoLocationModels({required this.latitude, required this.longitude});

  factory GeoLocationModels.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return GeoLocationModels(latitude: 0.0, longitude: 0.0);
    }
    return GeoLocationModels(
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
