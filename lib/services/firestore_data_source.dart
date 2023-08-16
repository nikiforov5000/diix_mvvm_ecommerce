import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDataSource {
  final FirebaseFirestore _firestore;

  FirestoreDataSource(this._firestore);

  Future<DocumentSnapshot> fetchProductById(String id) {
    return _firestore.collection('products').doc(id).get();
  }

  Future<DocumentSnapshot> fetchFirstProduct() async {
    final productCollection = _firestore.collection('products');
    final firstProductSnapshot = await productCollection.limit(1).get();
    return firstProductSnapshot.docs.first;
  }
}