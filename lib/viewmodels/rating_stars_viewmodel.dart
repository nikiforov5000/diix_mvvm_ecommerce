import 'package:flutter/material.dart';

class RatingStarsViewModel {
  final double _rating;
  RatingStarsViewModel(this._rating);

  List<IconData> getStars() {
    List<IconData> stars = [];

    int fullStars = _rating.floor();
    bool halfStar = _rating % 1 > 0;

    for (int i = 0; i < fullStars; ++i) {
      stars.add(Icons.star);
    }
    if (halfStar) {
      stars.add(Icons.star_half);
    }
    return stars;
  }
}