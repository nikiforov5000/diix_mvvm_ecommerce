import 'package:diix_mvvm_ecommerce/constants/text_styles.dart';
import 'package:diix_mvvm_ecommerce/constants/units.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_tile_viewmodel.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductTileViewModel _viewModel;

  const ProductTile({required viewModel, Key? key})
      : _viewModel = viewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.grey.shade200,
        width: 130,
        height: 130,
        child: Column(
          children: [
            ProductTileImage(_viewModel.imageUrl),
            ProductTileTitle(_viewModel.title),
            ProductTileRate(_viewModel.rate),
            ProductTilePrice(_viewModel.price),
          ],
        ),
      ),
    );
  }
}

class ProductTileImage extends StatelessWidget {
  final String _imageUrl;
  const ProductTileImage(this._imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Image.network(_imageUrl),
    );
  }
}

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
        RatingStars(_rate),
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
class RatingVotes extends StatelessWidget {
  const RatingVotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '(126)',
      style: TextStyle(fontSize: 10),
      maxLines: 1,
    );
  }
}
class StylizedStar extends StatelessWidget {
  const StylizedStar(this.star, {Key? key}) : super(key: key);

  final IconData star;
  final double size = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13,
      child: Stack(
        children: [
          Icon(
            star,
            color: Colors.orangeAccent,
            size: size,
          ),
          Icon(
            Icons.star_border_outlined,
            color: Colors.orange,
            size: size,
          ),
        ],
      ),
    );
  }
}
class RatingStars extends StatelessWidget {
  RatingStars(this.rating, {Key? key}) : super(key: key);

  final double rating;
  final List<Widget> stars = [];

  void fillStars() {
    for (int i = 0; i < rating.floor(); ++i) {
      stars.add(const StylizedStar(Icons.star));
    }
    if (rating % 1 > 0) {
      stars.add(const StylizedStar(Icons.star_half));
    }
  }

  @override
  Widget build(BuildContext context) {
    fillStars();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}
class RatingNumber extends StatelessWidget {
  const RatingNumber(this.rating, {Key? key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Text(
      rating.toString(),
      style: kBlueRatingNumberTextStyle,
      maxLines: 1,
    );
  }
}

class ProductTileTitle extends StatelessWidget {
  final String _title;
  const ProductTileTitle(this._title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_title);
  }
}

class ProductTilePrice extends StatelessWidget {
  final Price _price;
  const ProductTilePrice(this._price, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currency,
          style: kPriceTextStyle.copyWith(fontSize: 15),
        ),
        Text(_price.thousands, style: kPriceTextStyle),
        Text(_price.whole, style: kPriceTextStyle),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _price.cents,
              style: kPriceTextStyle.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
        const SizedBox(
          width: 3,
        ),
      ],
    );
  }
}
