import 'package:dartz/dartz.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/domain/entities/email.dart';
import 'package:job_thing_technical_test/domain/repositories/candidate_repository.dart';

class GetEmails{
  final CandidateRepository repository;

  const GetEmails({required this.repository});

  Future<Either<Failure, List<Email>>> execute() {
    return repository.getCandidateEmail();
  }
}