import 'package:diix_mvvm_ecommerce/viewmodels/rating_stars_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_rating_votes.dart';
import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final RatingStarsViewModel _viewModel;
  RatingStars(this._viewModel, {Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    List<IconData> stars = _viewModel.getStars();
    List<StylizedStar> stylizedStars = stars.map((icon) => StylizedStar(icon)).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stylizedStars,
    );
  }
}
