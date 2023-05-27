import 'package:dartz/dartz.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/domain/entities/experience.dart';
import 'package:job_thing_technical_test/domain/repositories/candidate_repository.dart';

class GetExperiences{
  final CandidateRepository repository;

  const GetExperiences({required this.repository});

  Future<Either<Failure, List<Experience>>> execute() {
    return repository.getExperiences();
  }
}