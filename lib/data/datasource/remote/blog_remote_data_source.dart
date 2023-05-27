import 'package:dio/dio.dart';
import 'package:job_thing_technical_test/data/datasource/networking/api_client.dart';
import 'package:job_thing_technical_test/data/models/blog_model.dart';
import 'package:job_thing_technical_test/data/models/response/base_list_response.dart';

abstract class BlogRemoteDataSource {
  Future<BaseListResponse<BlogModel>> getBlogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final ApiClient _apiClient;

  BlogRemoteDataSourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<BaseListResponse<BlogModel>> getBlogs() async {
    try {
      final result = await _apiClient.getBlogs();
      return result;
    } on DioError {
      rethrow;
    }
  }
}
