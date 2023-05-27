import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:job_thing_technical_test/common/failure.dart';
import 'package:job_thing_technical_test/data/datasource/remote/blog_remote_data_source.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';
import 'package:job_thing_technical_test/domain/repositories/blog_repository.dart';
import 'package:logger/logger.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource _remoteDataSource;

  const BlogRepositoryImpl({required BlogRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Blog>>> getBlogs() async {
    try {
      final result = await _remoteDataSource.getBlogs();
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
