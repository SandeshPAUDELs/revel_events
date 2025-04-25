class Geolocation {
  final double? latitude;
  final double? longitude;

  Geolocation({this.latitude, this.longitude});
}

class Venue {
  final String? id;
  final String? name;
  final String? city;
  final String? address;
  final Geolocation? geolocation;
  final String? google_map_url;

  Venue({
    this.id,
    this.name,
    this.city,
    this.address,
    this.geolocation,
    this.google_map_url,
  });
}

class Artist {
  final String? id;
  final String? name;
  final String? image;

  Artist({this.id, this.name, this.image});
}

class Organizer {
  final String? id;
  final String? name;
  final String? description;
  final bool? isFollowed;
  final String? image;
  final int? totalFollowersCount;

  Organizer({
    this.id,
    this.name,
    this.description,
    this.isFollowed,
    this.image,
    this.totalFollowersCount,
  });
}

class AmountRange {
  final String? highest_amount;
  final String? lowest_amount;

  AmountRange({this.highest_amount, this.lowest_amount});
}

class Og {
  final String? url;
  final String? image;

  Og({this.url, this.image});
}

class MetaDataJson {
  final Og? og;
  final String? title;
  final List<String>? keywords;
  final String? description;

  MetaDataJson({this.og, this.title, this.keywords, this.description});
}

class Event {
  final String? id;
  final String? name;
  final String? about;
  final String? venue;
  final String? age_constraint;
  final Map<String, String>? date_range;
  final List<String>? language;
  final List<String>? category;
  final List<String>? subcategory;
  final List<String>? event_type;
  final List<Artist>? artists;
  // final bool? isExclusive;
  final int? interested_count;
  // final bool? isInterested;
  // final bool? isFree;
  final AmountRange? amount_range;
  final Organizer? organizer;
  final MetaDataJson? metadata_json;
  // final String? image;

  Event({
    this.id,
    this.name,
    this.about,
    this.venue,
    this.age_constraint,
    this.date_range,
    this.language,
    this.category,
    this.subcategory,
    this.event_type,
    this.artists,
    // this.isExclusive,
    this.interested_count,
    // this.isInterested,
    // this.isFree,
    this.amount_range,
    this.organizer,
    this.metadata_json,
    // this.image,
  });
}

class TicketOptions {
  final String? id;
  final String? name;
  final String? description;
  final String? tag;
  final String? status;
  final String? amount;
  final String? amount_type;
  final int? number_of_participant;
  final int? number_of_free_participant;
  final String? app_amount;
  final String? sales_start_datetime;
  final String? sales_end_datetime;

  TicketOptions({
    this.id,
    this.name,
    this.description,
    this.tag,
    this.status,
    this.amount,
    this.amount_type,
    this.number_of_participant,
    this.number_of_free_participant,
    this.app_amount,
    this.sales_start_datetime,
    this.sales_end_datetime,
  });
}

class EventVenueDetails {
  final String? id;
  final String? image;
  final Event? event;
  final String? terms_and_condition;
  final Venue? venue;
  final String? start_datetime;
  final List<TicketOptions>? ticket_options;
  EventVenueDetails({
    this.id,
    this.image,
    this.event,
    this.terms_and_condition,
    this.venue,
    this.start_datetime,
    this.ticket_options,
  });
}
