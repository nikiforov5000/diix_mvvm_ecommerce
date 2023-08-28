import 'package:flutter/material.dart';

class ProductTileTitle extends StatelessWidget {
  final String _title;
  const ProductTileTitle(this._title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_title);
  }
}