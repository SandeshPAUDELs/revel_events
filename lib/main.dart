import 'package:event_app/core/config/routes/app_routes.dart';
import 'package:event_app/module/presentation/cubit/expandable_card_cubit.dart';
import 'package:event_app/module/presentation/cubit/expandable_text_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injection();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ExpandCubit()),
          BlocProvider(create: (context) => ExpandableTextCubit()),

          BlocProvider(create: (context) => EventVenueDetailCubit(getIt())),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRoute,
        ),
      ),
    );
  }
}