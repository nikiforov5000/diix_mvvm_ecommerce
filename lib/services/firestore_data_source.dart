import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_service.dart';

class FirestoreDataSource {
  final _firestore = FirestoreService.instance;

  Future<DocumentSnapshot> fetchProductById(String id) {
    return _firestore.collection('products').doc(id).get();
  }

  Future<List<QueryDocumentSnapshot>> fetchFirstProduct() async {
    final productCollection = await _firestore.collection('products').limit(1).get();
    return productCollection.docs;
  }

  Future<List<QueryDocumentSnapshot>> fetchAllProducts() async {
    final productCollection = await _firestore.collection('products').get();
    return productCollection.docs;
  }

}