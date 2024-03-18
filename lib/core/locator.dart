import 'package:dentsu/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:dentsu/features/auth/data/data_sources/remote_data_source/i_auth_remote_data_source.dart';
import 'package:dentsu/features/auth/data/repository/auth_repository.dart';
import 'package:dentsu/features/auth/data/repository/i_auth_repository.dart';
import 'package:dentsu/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:dentsu/features/home/data/data_sources/remote_data_source/i_home_remote_data_source.dart';
import 'package:dentsu/features/home/data/repository/home_repository.dart';
import 'package:dentsu/features/home/data/repository/i_home_repository.dart';
import 'package:dentsu/features/quotes/data/data_sources/remote_data_source/i_quotes_remote_data_source.dart';
import 'package:dentsu/features/quotes/data/data_sources/remote_data_source/quotes_remote_data_source.dart';
import 'package:dentsu/features/quotes/data/repository/i_quotes_repository.dart';
import 'package:dentsu/features/quotes/data/repository/quotes_repository.dart';
import 'package:dentsu/services/dialog_and_sheet_service/dialog_and_sheet_service.dart';
import 'package:dentsu/services/dialog_and_sheet_service/i_dialog_and_sheet_service.dart';
import 'package:dentsu/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:dentsu/services/firebase_auth_service/i_firebase_auth_service.dart';
import 'package:dentsu/services/firebase_db_service/firebase_db_service.dart';
import 'package:dentsu/services/firebase_db_service/i_firebase_db_service.dart';
import 'package:dentsu/services/navigation_service/i_navigation_service.dart';
import 'package:dentsu/services/navigation_service/navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setUpLocator() async {
  locator
      .registerLazySingleton<FirebaseAuthService>(() => IFirebaseAuthService());
  locator.registerLazySingleton<NavigationService>(() => INavigationService());
  locator.registerLazySingleton<DialogAndSheetService>(
      () => IDialogAndSheetService());
  locator.registerLazySingleton<AuthRepository>(() => IAuthRepository());
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => IAuthRemoteDataSource());
  locator.registerLazySingleton<HomeRepository>(() => IHomeRepository());
  locator.registerLazySingleton<HomeRemoteDataSource>(
      () => IHomeRemoteDataSource());
  locator.registerLazySingleton<FirebaseDbService>(() => IFirebaseDbService());
  locator.registerLazySingleton<QuotesRemoteDataSource>(
      () => IQuotesRemoteDataSource());
  locator.registerLazySingleton<QuotesRepository>(() => IQuotesRepository());
}
