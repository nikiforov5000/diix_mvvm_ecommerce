import 'package:diix_mvvm_ecommerce/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final ProductViewModel viewModel;

  const ProductScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchFirstProduct();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          /// TODO replace with real product
          future: viewModel.fetchFirstProduct(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Text(viewModel.product!.title);
          },
        ),
      ),
    );
  }
}
