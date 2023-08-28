import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection(this._snapshot, {Key? key}) : super(key: key);
  final AsyncSnapshot<List<Product>> _snapshot;

  @override
  Widget build(BuildContext context) {
    if (_snapshot.connectionState == ConnectionState.waiting ||
        _snapshot.hasData == false) {
      return const CircularProgressIndicator();
    }
    final products = _snapshot.data!;

    return Column(
      children: [
        for (Product product in products) ProductTile(product),
      ],
    );
  }
}
