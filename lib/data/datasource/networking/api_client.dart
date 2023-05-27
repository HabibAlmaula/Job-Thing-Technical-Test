import 'package:dio/dio.dart';
import 'package:job_thing_technical_test/data/datasource/networking/endpoints.dart';
import 'package:job_thing_technical_test/data/models/address_model.dart';
import 'package:job_thing_technical_test/data/models/blog_model.dart';
import 'package:job_thing_technical_test/data/models/candidate_model.dart';
import 'package:job_thing_technical_test/data/models/email_model.dart';
import 'package:job_thing_technical_test/data/models/experience_model.dart';
import 'package:job_thing_technical_test/data/models/response/base_list_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';


part 'api_client.g.dart';

@RestApi(baseUrl: Endpoint.BASE_URL)
abstract class ApiClient{
  factory ApiClient({required Dio dio}){
    dio.options =
        BaseOptions(receiveTimeout: const Duration(seconds: 15), connectTimeout: const Duration(seconds: 5), headers: {
          "Content-Type": "application/json",
        });
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return _ApiClient(dio);
  }


  @GET(Endpoint.GET_CANDIDATES)
  Future<BaseListResponse<CandidateModel>> getCandidates();

  @GET(Endpoint.GET_ADDRESS)
  Future<BaseListResponse<AddressModel>> getAddress();

  @GET(Endpoint.GET_EMAILS)
  Future<BaseListResponse<EmailModel>> getEmails();

  @GET(Endpoint.GET_EXPERIENCES)
  Future<BaseListResponse<ExperienceModel>> getExperiences();




  @GET(Endpoint.GET_BLOGS)
  Future<BaseListResponse<BlogModel>> getBlogs();


}