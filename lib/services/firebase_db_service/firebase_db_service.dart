import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/core/models/quote.dart';

abstract class FirebaseDbService {
  Future<Either<Failure, List<Lead>>> getPaginatedLeads(
      {required int startAt, required int limit});
  Future<Either<Failure, List<Quote>>> getPaginatedQuotes({
    required int startAt,
    required int limit,
  });

  Future<Either<Failure, int>> getAllLeadsCount();
  Future<Either<Failure, int>> getAllQuotesCount();
  Future<Either<Failure, int>> getContactedLeadsCount();
}
