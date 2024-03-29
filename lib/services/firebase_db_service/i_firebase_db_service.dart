import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dentsu/core/constants/db_keys.dart';
import 'package:dentsu/core/failure.dart';
import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dentsu/services/firebase_db_service/firebase_db_service.dart';
import 'package:logger/logger.dart';

class IFirebaseDbService implements FirebaseDbService {
  final _db = FirebaseFirestore.instance;
  final _logger = Logger();

  @override
  Future<Either<Failure, List<Lead>>> getPaginatedLeads(
      {required int startAt, required int limit}) async {
    try {
      final ref = _db
          .collection(DbKeys.leadsTableName)
          .orderBy('index')
          .startAt([startAt])
          .limit(limit)
          .withConverter(
              fromFirestore: Lead.fromFirestore,
              toFirestore: (lead, options) => lead.toFirestore());
      final snapshot = await ref.get();
      final leads = snapshot.docs.map((doc) => doc.data()).toList();
      _logger.i("Received leads from Firebase: $leads");
      return Right(leads);
    } catch (e) {
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getAllLeadsCount() async {
    try {
      var res = await _db.collection(DbKeys.leadsTableName).count().get();
      return Right(res.count ?? 0);
    } catch (e) {
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getContactedLeadsCount() async {
    try {
      var res = await _db
          .collection(DbKeys.leadsTableName)
          .where('isContacted', isEqualTo: true)
          .count()
          .get();
      return Right(res.count ?? 0);
    } catch (e) {
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Quote>>> getPaginatedQuotes({required int startAt, required int limit}) async{
    try {
      final ref = _db
          .collection(DbKeys.quotesTableName)
          .orderBy('index')
          .startAt([startAt])
          .limit(limit)
          .withConverter(
              fromFirestore: Quote.fromFirestore,
              toFirestore: (quote, options) => quote.toFirestore());
      final snapshot = await ref.get();
      final quotes = snapshot.docs.map((doc) => doc.data()).toList();
      _logger.i("Received quotes from Firebase: $quotes");
      return Right(quotes);
    } catch (e) {
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, int>> getAllQuotesCount() async {
    try{
      var res = await _db.collection(DbKeys.quotesTableName).count().get();
      return Right(res.count ?? 0);
    }catch (e){
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }
}
