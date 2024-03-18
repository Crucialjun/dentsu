import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/auth/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckAuthStatusUseCase with UseCases<Either<Failure, User?>, NoParams> {
  final _repo = locator<AuthRepository>();
  @override
  Future<Either<Failure, User?>> call(NoParams params) {
    return _repo.getSignedInUser();
  }
}
