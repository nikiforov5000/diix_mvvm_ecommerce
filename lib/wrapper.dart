import 'package:diix_mvvm_ecommerce/repositories/product_repository.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_data_source.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/screens/login_screen.dart';
import 'package:diix_mvvm_ecommerce/views/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();

    print('Wrapper() -> build -> ${authViewModel.state.toString()}');

    if (authViewModel.state == AuthState.Success) {
      return ProductScreen(
        viewModel: ProductViewModel(
          ProductRepository(
            FirestoreDataSource(),
          ),
        ),
      );
    }
    return LoginScreen();
  }
}