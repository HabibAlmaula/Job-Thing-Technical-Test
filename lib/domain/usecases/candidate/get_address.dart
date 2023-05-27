import 'package:dartz/dartz.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/domain/entities/address.dart';
import 'package:job_thing_technical_test/domain/repositories/candidate_repository.dart';

class GetAddress{
  final CandidateRepository repository;

  const GetAddress({required this.repository});

  Future<Either<Failure, List<Address>>> execute() {
    return repository.getCandidateAddres();
  }
}