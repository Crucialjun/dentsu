import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, User?>> getCurrentUser();
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      String email, String password);
}
