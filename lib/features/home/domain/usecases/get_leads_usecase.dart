import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/home/data/repository/home_repository.dart';
import 'package:dentsu/features/home/domain/params/get_leads_params.dart';

class GetLeadsUsecase
    with UseCases<Either<Failure, List<Lead>>, GetLeadsParams> {
  final _repository = locator<HomeRepository>();
  @override
  Future<Either<Failure, List<Lead>>> call(GetLeadsParams params) async {
    return await _repository.getLeads(
        startAt: params.startAt, limit: params.limit);
  }
}
