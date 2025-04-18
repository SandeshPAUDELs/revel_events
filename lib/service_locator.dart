import 'package:event_app/module/presentation/cubit/expandable_card_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> injection()  async {
  getIt.registerLazySingleton(() => ExpandCubit());

}