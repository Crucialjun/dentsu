import 'package:dartz/dartz.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dentsu/features/quotes/data/data_sources/remote_data_source/quotes_remote_data_source.dart';
import 'package:dentsu/features/quotes/data/repository/quotes_repository.dart';

class IQuotesRepository implements QuotesRepository{
  final _remoteDataSource = locator<QuotesRemoteDataSource>();
  @override
  Future<Either<Failure, List<Quote>>> getPaginatedQuotes({required int startAt, required int limit}) async {
    return await _remoteDataSource.getPaginatedQuotes(startAt: startAt, limit: limit);
    
  }
  
  @override
  Future<Either<Failure, int>> getAllQuotesCount() async{
    return await _remoteDataSource.getAllQuotesCount();
  }
  
}