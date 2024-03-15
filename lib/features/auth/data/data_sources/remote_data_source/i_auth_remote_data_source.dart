import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:dentsu/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IAuthRemoteDataSource implements AuthRemoteDataSource {
  final _firebaseAuthService = locator<FirebaseAuthService>();
  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    return await _firebaseAuthService.getCurrentUser();
  }

  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      String email, String password) async {
    return await _firebaseAuthService.signUpWithEmailAndPassword(
        email, password);
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      String email, String password) {
    return _firebaseAuthService.signInWithEmailAndPassword(email, password);
  }
}
