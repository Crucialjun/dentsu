import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/models/lead_model.dart';

abstract class HomeRepository{
  Future<Either<Failure, List<Lead>>> getLeads({required int startAt, required int limit});
}