import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_list_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/all_products_button.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/first_product_button.dart';
import 'package:diix_mvvm_ecommerce/views/widgets/product_list_section.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        return Column(
          children: [
            Column(
              children: [
                FirstProductButton(productListViewModel: _productListViewModel),
                AllProductsButton(productListModelView: _productListViewModel),
              ],
            ),
            ProductListSection(),
          ],
        );
      },
    );
  }
}
