import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_list_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductListViewModel _productListViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productListViewModel = context.read<ProductListViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<List<Product>>(
      stream: _productListViewModel.productsStream,
      builder: (BuildContext context, snapshot) {
        return Row(
          children: [
            _productsListSection(snapshot),
            Column(
              children: [
                _firstProductButton(),
                _allProductsButton(),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _productsListSection(snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting ||
        snapshot.hasData == false) {
      return const CircularProgressIndicator();
    }
    final products = snapshot.data!;

    return Column(
      children: [
        for (Product product in products)
          ProductTile(product)
      ],
    );
  }

  Widget _firstProductButton() {

    return TextButton(
      onPressed: () {
        print('First Product Only');
        _productListViewModel.fetchFirstProduct();
      },
      child: Text('First Product Only'),
    );
  }

  Widget _allProductsButton() {
    return TextButton(
      onPressed: () {
        print('All Products');
        _productListViewModel.fetchAllProducts();
      },
      child: Text('All Products'),
    );
  }
}
