import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class IFirebaseAuthService implements FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Logger _logger = Logger();
  @override
  Future<Either<Failure, User?>> getCurrentUser() {
    try {
      final user = _firebaseAuth.currentUser;
      return Future.value(right(user));
    } catch (e) {
      _logger.e(e);
      return Future.value(left(Failure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _logger.e(e.message);
        return left(const Failure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        _logger.e(e.message);
        return left(
            const Failure('The account already exists for that email.'));
      }
      _logger.e(e.message);
      return left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e);
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _logger.e(e.message);
        return left(const Failure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        _logger.e(e.message);
        return left(const Failure('Wrong password provided for that user.'));
      }
      _logger.e(e.message);
      return left(Failure(e.toString()));
    } catch (e) {
      _logger.e(e);
      return left(Failure(e.toString()));
    }
  }
}
