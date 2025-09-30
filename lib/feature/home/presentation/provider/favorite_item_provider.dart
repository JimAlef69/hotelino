import 'package:flutter/material.dart';
import 'package:hotelino/feature/home/data/models/hotel.dart';
import 'package:hotelino/feature/home/data/repositories/hotel_repository.dart';

class FavoriteItemProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  FavoriteItemProvider(this._hotelRepository) {
    fetchHotels();
  }

  List<Hotel> _hotels = [];
  final List<String> _favoriteHotelIds = [];

  Future<void> fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  List<Hotel> get favoriteHotels =>
      _hotels.where((hotel) => _favoriteHotelIds.contains(hotel.id)).toList();

  bool isFavorite(String hotelId) {
    return _favoriteHotelIds.contains(hotelId);
  }

  Future<void> toggleFavorite(String hotelId) async {
    if (isFavorite(hotelId)) {
      _favoriteHotelIds.remove(hotelId);
    } else {
      _favoriteHotelIds.add(hotelId);
    }
    notifyListeners();
  }
}
