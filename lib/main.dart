import 'package:device_preview/device_preview.dart';
import 'package:event_app/core/config/routes/app_routes.dart';
import 'package:event_app/module/presentation/cubit/expandable_card_cubit.dart';
import 'package:event_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection();
  runApp(
    DevicePreview(
      builder: (BuildContext context) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ExpandCubit())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRoute,
      ),
    );
  }
}
