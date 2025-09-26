import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hotelino/bootstrap.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/feature/booking/presentation/provider/booking_provider.dart';
import 'package:hotelino/feature/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/feature/home/data/repositories/profile_repository.dart';
import 'package:hotelino/feature/home/presentation/provider/favorite_item_provider.dart';
import 'package:hotelino/feature/home/presentation/provider/home_provider.dart';
import 'package:hotelino/feature/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:hotelino/shared/services/json_data_service.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await lazyBootstrap();
  FlutterNativeSplash.remove();

  final hotelRepository = HotelRepository(jsonDataService: JsonDataService());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
        ChangeNotifierProvider(create: (_) => HomeProvider(hotelRepository)),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(ProfileRepository(), hotelRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteItemProvider(hotelRepository),
        ),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    //for listening to system theme changes
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    //for disposing the observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(context, listen: false).updateTheme(brightness);
    super.didChangePlatformBrightness();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget? child) {
        return MaterialApp(
          title: 'Hotelino',
          debugShowCheckedModeBanner: false,
          locale: const Locale('fa', 'IR'),
          supportedLocales: const [
            Locale('fa', 'IR'), // Persian, Iran
            Locale('en', 'US'), // Persian, Iran
          ],
          localizationsDelegates: const [
            PersianMaterialLocalizations.delegate,
            PersianCupertinoLocalizations.delegate, // For Cupertino widgets
          ],
          routes: AppRoute.routes,
          initialRoute: AppRoute.home,
          theme: value.brightness == Brightness.light
              ? AppTheme.lightTheme
              : AppTheme.darkTheme,
        );
      },
    );
  }
}
