import 'package:flutter/material.dart';

class ProductTileImage extends StatelessWidget {
  final String _imageUrl;
  const ProductTileImage(this._imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Image.network(_imageUrl),
    );
  }
}
