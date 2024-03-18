import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/quotes/data/repository/quotes_repository.dart';

class GetAllQuotesCountUsecase with UseCases<Either<Failure, int>, NoParams> {
  final _repo = locator<QuotesRepository>();
  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await _repo.getAllQuotesCount();
  }
}