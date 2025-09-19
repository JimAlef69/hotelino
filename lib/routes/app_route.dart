import 'package:flutter/material.dart';
import 'package:hotelino/routes/main_bootom_nav.dart';

class AppRoute {
  static const String home = '/';
  static const String hotelDetail = '/hotel-detail';
  static const String bookingForm = '/booking-form';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String onboarding = '/onboarding';

  static final Map<String, WidgetBuilder> routes = {
    home: (ctx) => const MainBootomNav()
  };
}