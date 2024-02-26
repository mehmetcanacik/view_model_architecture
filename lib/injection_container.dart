import 'package:firebase_app/service/auth_service.dart';
import 'package:firebase_app/views/login/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerFactory<LoginViewModel>(
    () => LoginViewModel(),
  );
  getIt.registerFactory<AuthService>(
    () => AuthService(instance: FirebaseAuth.instance),
  );
}

List<SingleChildWidget> providers = [
  Provider<AuthService>(
    create: (context) => getIt<AuthService>(),
  ),
];
