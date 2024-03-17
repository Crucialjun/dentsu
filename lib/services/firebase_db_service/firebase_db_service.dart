import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/models/lead_model.dart';

abstract class FirebaseDbService {
  Future<Either<Failure, List<Lead>>> getPaginatedLeads(
      {required int startAt, required int limit});
}
