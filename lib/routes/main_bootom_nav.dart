import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/core/utils/keyboard.dart';
import 'package:hotelino/feature/booking/presentation/screen/booking_page.dart';
import 'package:hotelino/feature/home/presentation/screens/home_page.dart';
import 'package:hotelino/test.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainBootomNav extends StatefulWidget {
  const MainBootomNav({super.key});

  @override
  State<MainBootomNav> createState() => _MainBootomNavState();
}

class _MainBootomNavState extends State<MainBootomNav> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const FavPage(),
      BookingPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      onItemSelected: (index) {
        unfocusEditors(
          context,
        ); //for deaactivating keyboard and focus from text fields in all pages

        if (index != 2) {
          BookingPage.bookingPageKey.currentState?.resetForm();
        }
      },
      items: _navBarsItems(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      navBarStyle: NavBarStyle.style7,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      confineToSafeArea: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(microseconds: 200),
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_home.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_home.svg',
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_favorite.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_favorite.svg',
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_booking.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_booking.svg',
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/images/nav_profile.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveIcon: SvgPicture.asset(
          'assets/images/nav_profile.svg',
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
      ),
    ];
  }
}
