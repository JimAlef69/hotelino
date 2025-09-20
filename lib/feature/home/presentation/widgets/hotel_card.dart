// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hotelino/feature/home/data/models/hotel.dart';
import 'package:hotelino/feature/home/presentation/provider/favorite_item_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HotelCard extends StatelessWidget {
  Hotel hotel;

  HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(hotel.id);

    return GestureDetector(
      onTap: () {
        // PersistentNavBarNavigator.pushNewScreen(
        //   context,
        //   withNavBar: true,
        //   screen: HotelDetailPage(hotelId: hotel.id),
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      },
      child: SizedBox(
        width: 280,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(children: [],),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
