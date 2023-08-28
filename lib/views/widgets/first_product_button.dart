import 'package:diix_mvvm_ecommerce/viewmodels/product_list_viewmodel.dart';
import 'package:flutter/material.dart';

class FirstProductButton extends StatelessWidget {
  final ProductListViewModel _productListViewModel;

  const FirstProductButton({
    required productListViewModel,
    Key? key,
  })  : _productListViewModel = productListViewModel,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('First Product Only');
        _productListViewModel.fetchFirstProduct();
      },
      child: const Text('First Product Only'),
    );
  }
}
