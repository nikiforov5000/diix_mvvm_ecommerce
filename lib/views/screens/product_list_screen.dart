import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final ProductListViewModel _productListViewModel =
        context.watch<ProductListViewModel>();
    _productListViewModel.fetchAllProducts();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: _productListViewModel.products
              .map((product) => ProductTile(product))
              .toList(),
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product _product;

  const ProductTile(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_product.title.split(' ').getRange(0, 2).join('')),
      ],
    );
  }
}
