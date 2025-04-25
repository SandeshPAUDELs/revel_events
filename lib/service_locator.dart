import 'package:dio/dio.dart';
import 'package:event_app/module/data/datasource/event_venue_details_source.dart';
import 'package:event_app/module/data/repository/event_venue_details_repo_impl.dart';
import 'package:event_app/module/domain/repository/event_venue_details_repo.dart';
import 'package:event_app/module/domain/usecases/event_venue_details_usecases.dart';
import 'package:event_app/module/presentation/cubit/expandable_card_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void injection() {
  getIt.registerFactory(() => ExpandCubit());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton(() => EventVenueDetailsUsecases(getIt()));
  getIt.registerLazySingleton<EventVenueDetailsSource>(() => EventVenueDetailsDataSourceImpl(dio: getIt()));
  getIt.registerLazySingleton<EventVenueDetailsRepo>(() => EventVenueDetailsRepoImpl(datasource: getIt()));
  getIt.registerFactory(() => EventVenueDetailCubit(getIt()));
}
// {
//   "id": "86bf0df3-e8bc-4055-9874-5e65df93e66f",
//   "image": "https://revel-event-dev.s3.amazonaws.com/media/filer/filer_public/25/e5/25e53432-c202-44e7-8ef2-dc0be51c2403/sabin-rai-nepali-singer-artistnepal-1.png",
//   "event": {
//     "id": "a7ec1966-41c8-4a3b-8964-ba913d75ef8e",
//     "name": "Sabin Rai Live",
//     "about": "sabin rai",
//     "venue": "Kings Lounge Pokhara-Pokhara",
//     "age_constraint": "18yrs+",
//     "date_range": {
//       "start_datetime": "Wed, 23 Apr 2025 - 11:42 AM",
//       "end_datetime": "Wed, 23 Apr 2025 - 11:49 AM"
//     },
//     "language": [
//       "Nepali"
//     ],
//     "category": [
//       "Music Shows"
//     ],
//     "subcategory": [
//       "Pop",
//       "Rock"
//     ],
//     "event_type": [
//       "Outdoor Events"
//     ],
//     "artists": [
//       {
//         "id": "b32e3bf4-b56f-44e9-be4f-e6da30bf6d9a",
//         "name": "Sabin Rai and The Pharaoh",
//         "image": "https://revel-event-dev.s3.amazonaws.com/media/filer/filer_public/53/dd/53dda8e9-8a05-4ca7-ba9e-106b72b0b1c2/default-artist.png"
//       }
//     ],
//     "event_content": [],
//     "image": "https://revel-event-dev.s3.amazonaws.com/media/filer/filer_public/25/e5/25e53432-c202-44e7-8ef2-dc0be51c2403/sabin-rai-nepali-singer-artistnepal-1.png",
//     "is_exclusive": false,
//     "interested_count": 0,
//     "is_interested": false,
//     "is_free": false,
//     "amount_range": {
//       "highest_amount": "499.97",
//       "lowest_amount": "99.97"
//     },
//     "organizer": {
//       "id": "583fc6ba-e7c4-4409-8461-15c3f9619be3",
//       "name": "Kings Lounge Pokhara",
//       "description": "Nestled in the vibrant Lakeside area of Pokhara, Kings Lounge and Bar is a premier destination that combines a sophisticated ambiance with the lively, welcoming spirit of Nepal's tourism capital. Known for its unique blend of live music, and flavorful cuisine. Enjoy your favorite dishes with loved.",
//       "is_followed": false,
//       "image": "https://revel-auth-dev.s3.amazonaws.com/media/business/kings-lounge-pokhara/kings-lounge-pokhara.jpg",
//       "total_followers_count": 2
//     },
//     "metadata_json": {
//       "og": {
//         "url": "https://revelarena.com/qr/qr/QGLJIt",
//         "image": "https://revel-event-dev.s3.amazonaws.com/media/filer/filer_public/25/e5/25e53432-c202-44e7-8ef2-dc0be51c2403/sabin-rai-nepali-singer-artistnepal-1.png"
//       },
//       "title": "Sabin Rai Live",
//       "keywords": [
//         "Sabin Rai and The Pharaoh",
//         "event",
//         "tickets",
//         "booking",
//         "concert"
//       ],
//       "description": "sabin rai"
//     }
//   },
//   "start_datetime": "Wed, 23 Apr 2025 - 11:42 AM",
//   "has_registration": false,
//   "fill_all_participant": false,
//   "table_reservation_url": null,
//   "venue": {
//     "id": "5b76b8c6-e02a-4975-a32b-79077392c60d",
//     "name": "Kings Lounge Pokhara",
//     "city": "Pokhara",
//     "address": "Lakeside",
//     "geolocation": {
//       "latitude": 28.21007092196787,
//       "longitude": 83.95686073636433
//     },
//     "google_map_url": "https://www.google.com/maps/place/28.21007092196787,83.95686073636433"
//   },
//   "status": "sold_out",
//   "end_datetime": "Wed, 23 Apr 2025 - 11:49 AM",
//   "ticket_options": [
//     {
//       "id": "642d1ddd-ccce-4844-abc9-35b227a87d9e",
//       "name": "Early Bird",
//       "description": "<p>This is early bird</p>",
//       "tag": "In High Demand",
//       "status": "closed",
//       "amount": "99.97",
//       "amount_type": "per_person",
//       "number_of_participant": 1,
//       "number_of_free_participant": 0,
//       "app_amount": "99.97",
//       "sales_start_datetime": "Wed, 23 Apr 2025 - 11:14 AM",
//       "sales_end_datetime": "Fri, 25 Apr 2025 - 05:00 PM"
//     },
//     {
//       "id": "acb9a4d0-bb92-4a18-b063-c61051dbe168",
//       "name": "Early bird with beer",
//       "description": null,
//       "tag": null,
//       "status": "closed",
//       "amount": "499.97",
//       "amount_type": "per_person",
//       "number_of_participant": 1,
//       "number_of_free_participant": 0,
//       "app_amount": "499.97",
//       "sales_start_datetime": "Wed, 23 Apr 2025 - 11:14 AM",
//       "sales_end_datetime": "Fri, 25 Apr 2025 - 05:00 PM"
//     }
//   ],
//   "terms_and_condition": "<p>1. Tickets once booked cannot be exchanged or refunded</p><p>2. An Internet handling fee per ticket may be levied. Please check the total amount before payment</p><p>3. We recommend that you arrive at-least 1 hour prior at the venue for a seamless entry&nbsp;</p><p>4. Please do not purchase tickets if you feel sick</p><p>5. Unlawful resale (or attempted unlawful resale) of a ticket would lead to seizure or cancellation of that ticket without refund or other compensation</p><p>6. Rights of admission reserved</p><p>7. These terms and conditions are subject to change from time to time at the discretion of the organizer</p>",
//   "metadata_json": {
//     "og": {
//       "url": "https://revelarena.com/qr/single-event/iDn7qb",
//       "image": "https://revel-event-dev.s3.amazonaws.com/media/filer/filer_public/25/e5/25e53432-c202-44e7-8ef2-dc0be51c2403/sabin-rai-nepali-singer-artistnepal-1.png"
//     },
//     "title": "Sabin Rai Live",
//     "keywords": [
//       "Sabin Rai and The Pharaoh",
//       "event",
//       "tickets",
//       "booking",
//       "concert"
//     ],
//     "description": "sabin rai"
//   }
// }