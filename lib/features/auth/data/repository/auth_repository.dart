import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, User?>> getSignedInUser();
}
