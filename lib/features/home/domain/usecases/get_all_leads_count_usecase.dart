import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/home/data/repository/home_repository.dart';

class GetAllLeadsCountUsecase with UseCases<Either<Failure, int>, NoParams> {
  final _repo = locator<HomeRepository>();
  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await _repo.getAllLeadsCount();
  }
}
