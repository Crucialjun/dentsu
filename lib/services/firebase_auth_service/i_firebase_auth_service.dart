import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IFirebaseAuthService implements FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, User?>> getCurrentUser() {
    try {
      final user = _firebaseAuth.currentUser;
      return Future.value(right(user));
    } catch (e) {
      return Future.value(left(Failure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(const Failure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(
            const Failure('The account already exists for that email.'));
      }
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
