import 'package:dartz/dartz.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';
import 'package:job_thing_technical_test/domain/repositories/blog_repository.dart';

class GetBlogs {
  final BlogRepository repository;

  const GetBlogs({required this.repository});

  Future<Either<Failure, List<Blog>>> execute() {
    return repository.getBlogs();
  }
}
