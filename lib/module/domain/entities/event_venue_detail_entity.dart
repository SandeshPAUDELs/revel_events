import 'package:equatable/equatable.dart';

class Geolocation extends Equatable {
  final double? latitude;
  final double? longitude;

  const Geolocation({this.latitude, this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}

class Venue extends Equatable {
  final String? id;
  final String? name;
  final String? city;
  final String? address;
  final Geolocation? geolocation;
  final String? google_map_url;

  const Venue({
    this.id,
    this.name,
    this.city,
    this.address,
    this.geolocation,
    this.google_map_url,
  });

  @override
  List<Object?> get props => [id, name, city, address, geolocation, google_map_url];
}

class Artist extends Equatable{
  final String? id;
  final String? name;
  final String? image;

  const Artist({this.id, this.name, this.image});
  @override
  List<Object?> get props => [id, name, image];
}

class Organizer extends Equatable{
  final String? id;
  final String? name;
  final String? description;
  final bool? isFollowed;
  final String? image;
  final int? totalFollowersCount;

  const Organizer({
    this.id,
    this.name,
    this.description,
    this.isFollowed,
    this.image,
    this.totalFollowersCount,
  });
  @override
  List<Object?> get props => [id, name, description, isFollowed, image, totalFollowersCount];
}

class AmountRange extends Equatable {
  final String? highest_amount;
  final String? lowest_amount;

  const AmountRange({this.highest_amount, this.lowest_amount});
  @override
  List<Object?> get props => [highest_amount, lowest_amount];
}

class Og extends Equatable {
  final String? url;
  final String? image;

  const Og({this.url, this.image});
  @override
  List<Object?> get props => [url, image];
}

class MetaDataJson extends Equatable{
  final Og? og;
  final String? title;
  final List<String>? keywords;
  final String? description;

  const MetaDataJson({this.og, this.title, this.keywords, this.description});
  @override
  List<Object?> get props => [og, title, keywords, description];
}

class Event extends Equatable {
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
  @override
  List<Object?> get props => [
        id,
        name,
        about,
        venue,
        age_constraint,
        date_range,
        language,
        category,
        subcategory,
        event_type,
        artists,
        // isExclusive,
        interested_count,
        // isInterested,
        // isFree,
        amount_range,
        organizer,
        metadata_json,
      ];
}

class TicketOptions extends Equatable {
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

  const TicketOptions({
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
@override
  List<Object?> get props => [
        id,
        name,
        description,
        tag,
        status,
        amount,
        amount_type,
        number_of_participant,
        number_of_free_participant,
        app_amount,
        sales_start_datetime,
        sales_end_datetime,
      ];
}

class EventVenueDetails extends Equatable {
  final String? id;
  final String? image;
  final Event? event;
  final String? terms_and_condition;
  final Venue? venue;
  final String? start_datetime;
  final List<TicketOptions>? ticket_options;
  const EventVenueDetails({
    this.id,
    this.image,
    this.event,
    this.terms_and_condition,
    this.venue,
    this.start_datetime,
    this.ticket_options,
  });
  @override
  List<Object?> get props => [
        id,
        image,
        event,
        terms_and_condition,
        venue,
        start_datetime,
        ticket_options,
      ];
}
