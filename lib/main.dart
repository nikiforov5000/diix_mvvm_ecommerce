import 'package:diix_mvvm_ecommerce/models/product.dart';
import 'package:diix_mvvm_ecommerce/repositories/product_repository.dart';
import 'package:diix_mvvm_ecommerce/repositories/provider_repository.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_data_source.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/views/screens/product_screen.dart';
import 'package:diix_mvvm_ecommerce/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderRepository.providers,
      child: MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == ProductScreen.id) {
            final Product product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) {
                return ProductScreen(productId: product.id,);
              }
            );
          }
          return null;
        },
        routes: {
          /// Routes
        },
        home: Wrapper(),
      ),
    );
  }
}
