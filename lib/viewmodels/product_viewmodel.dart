import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/repositories/product_repository.dart';

class ProductViewModel {
  final ProductRepository _productRepository;

  Product? _product;

  ProductViewModel(this._productRepository);

  Product? get product => _product;

  Future<void> fetchProduct(String id) async {
    _product = await _productRepository.getProduct(id);
  }

  Future<void> fetchFirstProduct() async {
    _product = await _productRepository.getFirstProduct();

  }
  /// EXAMPLES
  /// // 2. Toggle favorite status of the product
  /// void toggleFavorite() {
  ///   _isFavorited = !_isFavorited;
  ///   // Notify the repository or data source about this change if needed.
  ///   _productRepository.setFavoriteStatus(_product!.id, _isFavorited);
  /// }
  ///
  /// // 3. Update product rating
  /// Future<void> updateRating(double rating) async {
  ///   _product!.rate = rating;
  ///   await _productRepository.updateProductRating(_product!.id, rating);
  ///   // Note: You might want to handle exceptions and errors here or in the repository itself.
  /// }
}