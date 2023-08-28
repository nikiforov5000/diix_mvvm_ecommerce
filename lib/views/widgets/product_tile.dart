import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product _product;

  const ProductTile(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_product.title.split(' ').getRange(0, 2).join(' ')),
      ],
    );
  }
}
