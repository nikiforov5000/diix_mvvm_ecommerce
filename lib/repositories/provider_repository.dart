import 'package:diix_mvvm_ecommerce/services/firebase_auth_service.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderRepository {
  static final providers = <SingleChildWidget>[
    ChangeNotifierProvider(
        create: (context) => AuthViewModel(FirebaseAuthService())),
        /// Other providers
  ];
}
