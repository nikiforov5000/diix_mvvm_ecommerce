import 'package:diix_mvvm_ecommerce/constants/text_styles.dart';
import 'package:diix_mvvm_ecommerce/constants/units.dart';
import 'package:diix_mvvm_ecommerce/models/price.dart';
import 'package:flutter/material.dart';

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
