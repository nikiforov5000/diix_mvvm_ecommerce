import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diix_mvvm_ecommerce/repositories/product_repository.dart';
import 'package:diix_mvvm_ecommerce/services/firebase_auth_service.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_data_source.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/screens/login_screen.dart';
import 'package:diix_mvvm_ecommerce/views/screens/product_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    create: (context) => AuthViewModel(FirebaseAuthService()),
    child: MaterialApp(home: Wrapper()),
  ));
}

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);
  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    if (authViewModel.state == AuthState.Success) {
      print('Wrapper() -> build -> success');
      return ProductScreen(
        viewModel: ProductViewModel(
          ProductRepository(
            FirestoreDataSource(firebase),
          ),
        ),
      );
    }
    print('Wrapper() -> build -> ${authViewModel.state.toString()}');
    return LoginScreen();
  }
}
