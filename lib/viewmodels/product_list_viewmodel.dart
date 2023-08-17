import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/repositories/product_list_repository.dart';
import 'package:flutter/material.dart';

enum ScreenState { idle, loading, error, ready }

class ProductListViewModel extends ChangeNotifier{
  final ProductListRepository _productListRepository;
  ScreenState _state = ScreenState.idle;

  ProductListViewModel(this._productListRepository);

  List<Product> _products = [];

  List<Product> get products => _products;

  ScreenState get state => _state;

  bool isLoading() {
    return _state == ScreenState.loading;
  }
  bool isReady() {
    return _state == ScreenState.ready;
  }
  bool hasError() {
    return _state == ScreenState.error;
  }

  Future<void> fetchAllProducts() async {
    _state = ScreenState.loading;
    _products = await _productListRepository.getAllProducts();
    notifyListeners();
  }
}
