import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/repositories/product_repository.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_data_source.dart';

class ProductListRepository {
  final FirestoreDataSource _dataSource;
  final ProductRepository _productRepository;

  ProductListRepository(this._dataSource)
      : _productRepository = ProductRepository(_dataSource);

  Future<List<Product>> getAllProducts() async {
    final docs = await _dataSource.fetchAllProducts();
    List<Product> products =
        docs.map((doc) => _productRepository.fromFirestore(doc)).toList();
    return products;
  }
}