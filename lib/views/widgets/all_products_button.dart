import 'package:diix_mvvm_ecommerce/viewmodels/product_list_viewmodel.dart';
import 'package:flutter/material.dart';

class AllProductsButton extends StatelessWidget {
  final ProductListViewModel _productListViewModel;

  const AllProductsButton({
    required productListModelView,
    Key? key,
  })  : _productListViewModel = productListModelView,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('All Products');
        _productListViewModel.fetchAllProducts();
      },
      child: const Text('All Products'),
    );
  }
}
