import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/models/quote.dart';

abstract class QuotesRemoteDataSource{
  Future<Either<Failure, List<Quote>>> getPaginatedQuotes({
    required int startAt,
    required int limit,
  });
  Future<Either<Failure, int>> getAllQuotesCount();
}