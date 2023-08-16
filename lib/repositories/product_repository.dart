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
    return Product(
      id: doc['id'],
      title: doc['title'],
      price: doc['price'],
      imgUrl: doc['imgUrl'],
      description: doc['description'],
      rate: doc['rate'],
      category: doc['category'],
    );
  }

}
