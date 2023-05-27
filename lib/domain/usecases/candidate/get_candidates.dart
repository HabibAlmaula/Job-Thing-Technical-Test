import 'package:dartz/dartz.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/domain/repositories/candidate_repository.dart';

class GetCandidate{
  final CandidateRepository repository;

  const GetCandidate({required this.repository});

  Future<Either<Failure, List<Candidate>>> execute() {
    return repository.getCandidates();
  }
}