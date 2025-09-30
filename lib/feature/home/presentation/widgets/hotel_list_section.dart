import 'package:flutter/material.dart';
import 'package:hotelino/feature/home/data/models/hotel.dart';
import 'package:hotelino/feature/home/presentation/widgets/hotel_card.dart';

class HotelListSection extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;
  final VoidCallback? onSeeAllPressed;
  const HotelListSection({
    super.key,
    required this.title,
    required this.hotels,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: null,
                child: Text(
                  'مشاهده همه',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(title, style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
        ),
        SizedBox(
          height: 360,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16),
            reverse: true, //for revers list in persian mode
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: HotelCard(hotel: hotels[index]),
              );
            },
            itemCount: hotels.length,
          ),
        ),
      ],
    );
  }
}
