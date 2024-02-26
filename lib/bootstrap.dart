import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> bootStrap() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
}
