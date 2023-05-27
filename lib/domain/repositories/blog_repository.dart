import 'package:dartz/dartz.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';

abstract class BlogRepository{
  Future<Either<Failure, List<Blog>>> getBlogs();
}