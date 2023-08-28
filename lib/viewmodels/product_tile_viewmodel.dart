import 'package:diix_mvvm_ecommerce/models/price.dart';
import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductTileViewModel extends ChangeNotifier {
  final Product _product;
  final Price _price;

  ProductTileViewModel({required product})
      : _product = product,
        _price = Price(product.price);

  String get title => _product.title.split(' ').getRange(0, 2).join(' ');
  String get description => _product.description;
  Price get price => _price;
  String get imageUrl => _product.imageUrl;
  String get rateString => getProductRateString();
  double get rate => _product.rate;

  String getPriceString() {
    return _product.price.toStringAsFixed(2);
  }

  String getProductRateString() {
    if (_product.rate % 1 == 0.0) {
      return _product.rate.toStringAsPrecision(0);
    }
    return _product.rate.toStringAsPrecision(1);
  }
}


