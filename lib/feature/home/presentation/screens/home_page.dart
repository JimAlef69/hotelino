import 'package:flutter/material.dart';
import 'package:hotelino/feature/home/presentation/provider/home_provider.dart';
import 'package:hotelino/feature/home/presentation/widgets/ad_banner.dart';
import 'package:hotelino/feature/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/feature/home/presentation/widgets/hotel_list_section.dart';
import 'package:hotelino/feature/home/presentation/widgets/search_bar.dart';
import 'package:hotelino/feature/home/presentation/widgets/story_carousel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            const SearchBarWidget(),
            const SizedBox(height: 16),
            const AdBanner(),
            //use Consumer to listen to changes in HomeProvider
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  title: 'محبوب ترین هتل ها',
                  hotels: homeProvider.getPopularHotels(),
                  onSeeAllPressed: () {
                    // Navigate to see all special offers
                  },
                );
              },
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                  title: 'پیشنهاد ویژه امروز',
                  hotels: homeProvider.getSpecialOffersHotels(),
                  onSeeAllPressed: () {
                    // Navigate to see all special offers
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            //story carousel slider
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  images: homeProvider.getStoryImages(),
                  titles: homeProvider.storyTitles,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
