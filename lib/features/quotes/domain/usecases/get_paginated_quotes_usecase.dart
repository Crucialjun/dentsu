import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/home/domain/params/get_leads_params.dart';
import 'package:dentsu/features/quotes/data/repository/quotes_repository.dart';

class GetPaginatedQuotesUsecase with UseCases<Either<Failure,List<Quote>>,GetPaginatedLeadsParams>{
  final _repo = locator<QuotesRepository>();
  @override
  Future<Either<Failure, List<Quote>>> call(GetPaginatedLeadsParams params) async {
    return await _repo.getPaginatedQuotes(startAt: params.startAt, limit: params.limit);
  }
  
}