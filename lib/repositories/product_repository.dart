import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_data_source.dart';

class ProductRepository {
  final FirestoreDataSource _dataSource;

  ProductRepository(this._dataSource);

  Future<Product> getProduct(String id) async {
    final doc = await _dataSource.fetchProductById(id);
    return fromFirestore(doc);

  }

  Future<Product> getFirstProduct() async {
    final doc = await _dataSource.fetchFirstProduct();
    return fromFirestore(doc);
  }

  Product fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      price: data['price'] ?? 0.0,
      imgUrl: data['imgUrl'] ?? '',
      description: data['description'] ?? '',
      rate: data['rate'] ?? '',
      category: data['category'] ?? '',
    );
  }

}
