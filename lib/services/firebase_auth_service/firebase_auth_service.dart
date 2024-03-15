import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Future<Either<Failure, User?>> getCurrentUser();
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(String email, String password);
}