import 'package:dartz/dartz.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/domain/entities/address.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/domain/entities/experience.dart';
import 'package:job_thing_technical_test/domain/entities/email.dart';

abstract class CandidateRepository {
  Future<Either<Failure, List<Candidate>>> getCandidates();
  Future<Either<Failure, List<Address>>> getCandidateAddres();
  Future<Either<Failure, List<Experience>>> getExperiences();
  Future<Either<Failure, List<Email>>> getCandidateEmail();
}