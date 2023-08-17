import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_service.dart';

class FirestoreDataSource {
  final _firestore = FirestoreService.instance;

  Future<DocumentSnapshot> fetchProductById(String id) {
    return _firestore.collection('products').doc(id).get();
  }

  Future<DocumentSnapshot> fetchFirstProduct() async {
    final productCollection = _firestore.collection('products');
    final firstProductSnapshot = await productCollection.limit(1).get();
    return firstProductSnapshot.docs.first;
  }

  Future<List<QueryDocumentSnapshot>> fetchAllProducts() async {
    final productCollection = await _firestore.collection('products').get();
    final docs = productCollection.docs;
    return docs;
  }

}