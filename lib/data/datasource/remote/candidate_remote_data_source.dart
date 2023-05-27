import 'package:dio/dio.dart';
import 'package:job_thing_technical_test/data/datasource/networking/api_client.dart';
import 'package:job_thing_technical_test/data/models/address_model.dart';
import 'package:job_thing_technical_test/data/models/candidate_model.dart';
import 'package:job_thing_technical_test/data/models/email_model.dart';
import 'package:job_thing_technical_test/data/models/experience_model.dart';
import 'package:job_thing_technical_test/data/models/response/base_list_response.dart';

abstract class CandidateRemoteDataSource {
  Future<BaseListResponse<CandidateModel>> getCandidates();

  Future<BaseListResponse<AddressModel>> getCandidateAddres();

  Future<BaseListResponse<ExperienceModel>> getExperiences();

  Future<BaseListResponse<EmailModel>> getCandidateEmail();
}

class CandidateRemoteDataSourceImpl implements CandidateRemoteDataSource {
  final ApiClient _apiClient;

  CandidateRemoteDataSourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<BaseListResponse<CandidateModel>> getCandidates() async {
    try {
      final result = await _apiClient.getCandidates();
      return result;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<BaseListResponse<AddressModel>> getCandidateAddres() async {
    try {
      final result = await _apiClient.getAddress();
      return result;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<BaseListResponse<EmailModel>> getCandidateEmail() async {
    try {
      final result = await _apiClient.getEmails();
      return result;
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<BaseListResponse<ExperienceModel>> getExperiences() async {
    try {
      final result = await _apiClient.getExperiences();
      return result;
    } on DioError {
      rethrow;
    }
  }
}
