import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/auth/data/repository/auth_repository.dart';
import 'package:dentsu/features/auth/domain/params/sign_in_with_email_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithEmailUseCase
    with UseCases<Either<Failure, User?>, SignInWithEmailParams> {
  final _repo = locator<AuthRepository>();
  @override
  Future<Either<Failure, User?>> call(SignInWithEmailParams params) async {
    return await _repo.signInWithEmailAndPassword(
        params.email, params.password);
  }
}
