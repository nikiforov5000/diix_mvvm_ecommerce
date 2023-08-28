import 'package:diix_mvvm_ecommerce/viewmodels/rating_stars_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_rating_number.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_rating_stars.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_rating_votes.dart';
import 'package:flutter/material.dart';

class ProductTileRate extends StatelessWidget {
  final double _rate;

  const ProductTileRate(this._rate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: RatingNumber(_rate),
        ),
        const SizedBox(
          width: 5,
        ),
        RatingStars(RatingStarsViewModel(_rate)),
        const SizedBox(
          width: 5,
        ),
        const Flexible(
          child: RatingVotes(),
        ),
      ],
    );
  }
}
