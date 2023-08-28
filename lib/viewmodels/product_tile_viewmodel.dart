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

class Price {
  final double price;

  Price(this.price) {
    fillMoneyVariables();
  }

  int? _thousands;
  int? _whole;
  int? _cents;

  String? _thousandsStr;
  String? _wholeStr;
  String? _centsStr;

  String get thousands => _thousandsStr ?? '';
  String get whole => _wholeStr ?? '';
  String get cents => _centsStr ?? '';

  void fillMoneyVariables() {
    _thousands = (price / 1000).floor();
    _whole = (price % 1000).floor();
    _cents = (price % 1 * 100).floor();

    if (_thousands! > 0) {
      _thousandsStr = '$_thousands.';
    } else {
      _thousandsStr = '';
    }

    _wholeStr = _whole.toString();
    if (_thousands! > 0 && _whole! < 100) {
      _wholeStr = '0${_wholeStr!}';
    }
    _centsStr = _cents.toString();
    if (_cents! < 10) {
      _centsStr = '0${_centsStr!}';
    }
  }
}
