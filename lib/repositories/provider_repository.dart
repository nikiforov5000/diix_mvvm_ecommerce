import 'package:diix_mvvm_ecommerce/repositories/product_list_repository.dart';
import 'package:diix_mvvm_ecommerce/repositories/product_repository.dart';
import 'package:diix_mvvm_ecommerce/services/firebase_auth_service.dart';
import 'package:diix_mvvm_ecommerce/services/firestore_data_source.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/auth_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_list_viewmodel.dart';
import 'package:diix_mvvm_ecommerce/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderRepository {
  static final providers = <SingleChildWidget>[
    /// Auth Provider
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(
        FirebaseAuthService(),
      ),
    ),

    /// ProductViewModel Provider
    ChangeNotifierProvider(
      create: (context) => ProductViewModel(
        ProductRepository(
          FirestoreDataSource(),
        ),
      ),

    ),

    /// ProductList Provider
    ChangeNotifierProvider(
      create: (context) => ProductListViewModel(
        ProductListRepository(
          FirestoreDataSource(),
        ),
      ),
    ),

    /// Other providers
  ];
}
