import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/data/datasource/remote/candidate_remote_data_source.dart';
import 'package:job_thing_technical_test/domain/entities/address.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/domain/entities/email.dart';
import 'package:job_thing_technical_test/domain/entities/experience.dart';
import 'package:job_thing_technical_test/domain/repositories/candidate_repository.dart';
import 'package:logger/logger.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  final CandidateRemoteDataSource _remoteDataSource;

  const CandidateRepositoryImpl(
      {required CandidateRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Address>>> getCandidateAddres() async {
    try {
      final result = await _remoteDataSource.getCandidateAddres();
      return Right(
          result.results?.map((result) => result.toEntity()).toList() ?? []);
    } on DioError catch (e) {
      Logger().e(e.response?.data);
      return Left(
        ServerFailure(
          dioErr(
            error: e,
            message: e.response?.data["message"],
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Email>>> getCandidateEmail() async {
    try {
      final result = await _remoteDataSource.getCandidateEmail();
      return Right(
          result.results?.map((result) => result.toEntity()).toList() ?? []);
    } on DioError catch (e) {
      Logger().e(e.response?.data);
      return Left(
        ServerFailure(
          dioErr(
            error: e,
            message: e.response?.data["message"],
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Candidate>>> getCandidates() async {
    try {
      final result = await _remoteDataSource.getCandidates();
      return Right(
          result.results?.map((result) => result.toEntity()).toList() ?? []);
    } on DioError catch (e) {
      Logger().e(e.response?.data);
      return Left(
        ServerFailure(
          dioErr(
            error: e,
            message: e.response?.data["message"],
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Experience>>> getExperiences() async {
    try {
      final result = await _remoteDataSource.getExperiences();
      return Right(
          result.results?.map((result) => result.toEntity()).toList() ?? []);
    } on DioError catch (e) {
      Logger().e(e.response?.data);
      return Left(
        ServerFailure(
          dioErr(
            error: e,
            message: e.response?.data["message"],
          ),
        ),
      );
    }
  }
}
