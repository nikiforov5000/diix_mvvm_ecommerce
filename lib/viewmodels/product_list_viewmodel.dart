import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/views/screens/product_list_screen.dart';

class ProductListViewModel {
  final ProductListRepository _productListRepository;

  ProductListViewModel(this._productListRepository);

  List<Product>? _productList;

  Future<void> fetchAllProducts() async {
    _productList = await _productListRepository.getAllProducts();
  }
}
