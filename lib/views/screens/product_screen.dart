import 'package:diix_mvvm_ecommerce/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  final String productId;

  static String id = '/productScreen';

  const ProductScreen({Key? key,required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductViewModel viewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          /// TODO replace with real product
          future: viewModel.fetchFirstProduct(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Text(viewModel.product!.title);
          },
        ),
      ),
    );
  }
}
