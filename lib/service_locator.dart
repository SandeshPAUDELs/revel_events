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
