import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_list_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_tile_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/screens/product_screen.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Consumer<ProductListViewModel>(
        builder: (BuildContext context, viewModel, child) {
          if (viewModel.isLoading()) {
            return const CircularProgressIndicator();
          }
          final products = viewModel.products;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  Navigator.pushNamed(context, ProductScreen.id,
                      arguments: product);
                },
              );
            },
          );
        },
      ),
    );
  }
}
