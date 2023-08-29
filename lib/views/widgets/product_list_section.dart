import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_tile_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/screens/product_screen.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile.dart';
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

    return Flexible(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          crossAxisCount: 2,
          childAspectRatio: 4 / 5,
        ),
        itemBuilder: (BuildContext context, int index) {

          Product product = products[index];
          return ProductTile(
            viewModel: ProductTileViewModel(product: product),
            onTapCallback: () {
              print('clicked on product ${product.title}');
              Navigator.pushNamed(context, ProductScreen.id, arguments: product);
            },
          );
        },
      ),
    );
  }
}
