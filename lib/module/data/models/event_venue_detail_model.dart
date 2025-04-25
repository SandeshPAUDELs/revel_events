class Geolocation {
  final double? latitude;
  final double? longitude;

  Geolocation({this.latitude, this.longitude});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude};
  }
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

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      address: json['address'],
      geolocation:
          json['geolocation'] != null
              ? Geolocation.fromJson(json['geolocation'])
              : null,
      google_map_url: json['google_map_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'address': address,
      'geolocation': geolocation?.toJson(),
      'google_map_url': google_map_url,
    };
  }
}

class Artist {
  final String? id;
  final String? name;
  final String? image;

  Artist({this.id, this.name, this.image});

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(id: json['id'], name: json['name'], image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }
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

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isFollowed: json['is_followed'],
      image: json['image'],
      totalFollowersCount: json['total_followers_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_followed': isFollowed,
      'image': image,
      'total_followers_count': totalFollowersCount,
    };
  }
}

class AmountRange {
  final String? highest_amount;
  final String? lowest_amount;

  AmountRange({this.highest_amount, this.lowest_amount});

  factory AmountRange.fromJson(Map<String, dynamic> json) {
    return AmountRange(
      highest_amount: json['highest_amount'],
      lowest_amount: json['lowest_amount'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'highest_amount': highest_amount, 'lowest_amount': lowest_amount};
  }
}

class Og {
  final String? url;
  final String? image;

  Og({this.url, this.image});

  factory Og.fromJson(Map<String, dynamic> json) {
    return Og(url: json['url'], image: json['image']);
  }
  Map<String, dynamic> toJson() {
    return {'url': url, 'image': image};
  }
}

class MetaDataJson {
  final Og? og;
  final String? title;
  final List<String>? keywords;
  final String? description;

  MetaDataJson({required this.og, this.title, this.keywords, this.description});
  factory MetaDataJson.fromJson(Map<String, dynamic> json) {
    return MetaDataJson(
      og: json['og'] != null ? Og.fromJson(json['og']) : null,
      title: json['title'],
      keywords:
          json['keywords'] != null ? List<String>.from(json['keywords']) : null,
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'og': og?.toJson(),
      'title': title,
      'keywords': keywords,
      'description': description,
    };
  }
}

class Event {
  final String? id;
  final String? name;
  final String? about;
  // final Venue? venue;
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

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      venue: json['venue'],
      age_constraint: json['age_constraint'],
      date_range:
          json['date_range'] != null
              ? Map<String, String>.from(json['date_range'])
              : null,
      language:
          json['language'] != null ? List<String>.from(json['language']) : null,
      category:
          json['category'] != null ? List<String>.from(json['category']) : null,
      subcategory:
          json['subcategory'] != null
              ? List<String>.from(json['subcategory'])
              : null,
      event_type:
          json['event_type'] != null
              ? List<String>.from(json['event_type'])
              : null,
      artists:
          json['artists'] != null
              ? (json['artists'] as List)
                  .map((item) => Artist.fromJson(item))
                  .toList()
              : null,
      // isExclusive: json['is_exclusive'],
      interested_count: json['interested_count'],
      // isInterested: json['is_interested'],
      // isFree: json['is_free'],
      amount_range:
          json['amount_range'] != null
              ? AmountRange.fromJson(json['amount_range'])
              : null,
      organizer:
          json['organizer'] != null
              ? Organizer.fromJson(json['organizer'])
              : null,

      metadata_json:
          json['metadata_json'] != null
              ? MetaDataJson.fromJson(json['metadata_json'])
              : null,
      // image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'about': about,
      // 'venue': venue?.toJson(),
      'venue': venue,
      'age_constraint': age_constraint,
      'date_range': date_range,
      'language': language,
      'category': category,
      'subcategory': subcategory,
      'event_type': event_type,
      'artists': artists?.map((e) => e.toJson()).toList(),
      // 'is_exclusive': isExclusive,
      'interested_count': interested_count,
      // 'is_interested': isInterested,
      // 'is_free': isFree,
      'amount_range': amount_range?.toJson(),
      'organizer': organizer?.toJson(),
      'metadata_json': metadata_json?.toJson(),
      // 'image': image,
    };
  }
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
  factory TicketOptions.fromJson(Map<String, dynamic> json) {
    return TicketOptions(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      tag: json['tag'],
      status: json['status'],
      amount: json['amount'],
      amount_type: json['amount_type'],
      number_of_participant: json['number_of_participant'],
      number_of_free_participant: json['number_of_free_participant'],
      app_amount: json['app_amount'],
      sales_start_datetime: json['sales_start_datetime'],
      sales_end_datetime: json['sales_end_datetime'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tag': tag,
      'status': status,
      'amount': amount,
      'amount_type': amount_type,
      'number_of_participant': number_of_participant,
      'number_of_free_participant': number_of_free_participant,
      'app_amount': app_amount,
      'sales_start_datetime': sales_start_datetime,
      'sales_end_datetime': sales_end_datetime,
    };
  }
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
  factory EventVenueDetails.fromJson(Map<String, dynamic> json) {
    return EventVenueDetails(
      id: json['id'],
      image: json['image'],
      event: json['event'] != null ? Event.fromJson(json['event']) : null,
      terms_and_condition: json['terms_and_condition'],
      venue: json['venue'] != null ? Venue.fromJson(json['venue']) : null,
      start_datetime: json['start_datetime'],
      ticket_options:
          json['ticket_options'] != null
              ? (json['ticket_options'] as List)
                  .map((item) => TicketOptions.fromJson(item))
                  .toList()
              : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'event': event?.toJson(),
      'terms_and_condition': terms_and_condition,
      'venue': venue?.toJson(),
      'start_datetime': start_datetime,
      'ticket_options': ticket_options?.map((e) => e.toJson()).toList(),
    };
  }
}
