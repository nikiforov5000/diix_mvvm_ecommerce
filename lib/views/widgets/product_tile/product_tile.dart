import 'package:diix_mvvm_ecommerce/viewmodels/product_tile_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_image.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_price.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_rate.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile/product_tile_title.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductTileViewModel _viewModel;
  final VoidCallback _onTapCallback;

  const ProductTile({required viewModel, required onTapCallback, Key? key})
      : _viewModel = viewModel,
        _onTapCallback = onTapCallback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapCallback,
      child: Container(
        color: Colors.grey.shade200,
        width: 130,
        height: 130,
        child: Column(
          children: [
            ProductTileImage(_viewModel.imageUrl),
            ProductTileTitle(_viewModel.title),
            ProductTileRate(_viewModel.rate),
            ProductTilePrice(_viewModel.price),
          ],
        ),
      ),
    );
  }
}
