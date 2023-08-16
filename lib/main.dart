import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diix_mvvm_ecommerce/repositories/product_repository.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_data_source.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/screens/product_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: ProductScreen(
          viewModel: ProductViewModel(
            ProductRepository(
              FirestoreDataSource(firebase),
            ),
          ),
        ),
      ),
    );
  }
}
