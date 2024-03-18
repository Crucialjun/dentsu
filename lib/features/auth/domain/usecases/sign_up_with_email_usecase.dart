import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/auth/data/repository/auth_repository.dart';
import 'package:dentsu/features/auth/domain/params/sign_up_with_email_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpWithEmailUsecase
    with UseCases<Either<Failure, User?>, SignUpWithEmailParams> {
  final _repository = locator<AuthRepository>();
  @override
  Future<Either<Failure, User?>> call(SignUpWithEmailParams params) {
    return _repository.signUpWithEmailAndPassword(
        params.email, params.password);
  }
}
