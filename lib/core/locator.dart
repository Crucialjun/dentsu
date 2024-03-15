import 'package:dentsu/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:dentsu/services/firebase_auth_service/i_firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setUpLocator() async {
  locator
      .registerLazySingleton<FirebaseAuthService>(() => IFirebaseAuthService());
}
