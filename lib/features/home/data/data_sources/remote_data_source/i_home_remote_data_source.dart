import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/features/home/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:dentsu/services/firebase_db_service/firebase_db_service.dart';

class IHomeRemoteDataSource implements HomeRemoteDataSource {
  final _dbService = locator<FirebaseDbService>();
  @override
  Future<Either<Failure, List<Lead>>> getLeads(
      {required int startAt, required int limit}) async {
    return await _dbService.getPaginatedLeads(startAt: startAt, limit: limit);
  }
}
