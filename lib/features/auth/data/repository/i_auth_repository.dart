import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:dentsu/features/auth/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IAuthRepository implements AuthRepository {
  final _remoteDataSource = locator<AuthRemoteDataSource>();
  @override
  Future<Either<Failure, User?>> getSignedInUser() {
    return _remoteDataSource.getCurrentUser();
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      String email, String password) async {
    return await _remoteDataSource.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      String email, String password) async {
    return await _remoteDataSource.signUpWithEmailAndPassword(email, password);
  }
}
