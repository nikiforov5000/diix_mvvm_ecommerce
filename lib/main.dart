import 'package:diix_mvvm_ecommerce/repositories/provider_repository.dart';
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
        home: Wrapper(),
      ),
    );
  }
}
