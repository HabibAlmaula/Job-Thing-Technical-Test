import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:job_thing_technical_test/data/datasource/networking/api_client.dart';
import 'package:job_thing_technical_test/data/datasource/remote/blog_remote_data_source.dart';
import 'package:job_thing_technical_test/data/datasource/remote/candidate_remote_data_source.dart';
import 'package:job_thing_technical_test/data/repositories/blog_repository_impl.dart';
import 'package:job_thing_technical_test/data/repositories/candidate_repository_impl.dart';
import 'package:job_thing_technical_test/domain/repositories/blog_repository.dart';
import 'package:job_thing_technical_test/domain/repositories/candidate_repository.dart';
import 'package:job_thing_technical_test/domain/usecases/blog/get_blogs.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_address.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_candidates.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_emails.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_experiences.dart';
import 'package:job_thing_technical_test/presentarion/pages/detail/candidate/bloc/candidate_bloc.dart';
import 'package:job_thing_technical_test/presentarion/pages/home/bloc/home_bloc.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(
    () => HomeBloc(
      getCandidate: locator(),
      getBlogs: locator(),
    ),
  );

  locator.registerFactory(
    () => CandidateBloc(
      getEmails: locator(),
      getAddress: locator(),
      getExperiences: locator(),
    ),
  );

  /// use case
  // candidates
  locator.registerLazySingleton(() => GetCandidate(repository: locator()));
  locator.registerLazySingleton(() => GetAddress(repository: locator()));
  locator.registerLazySingleton(() => GetEmails(repository: locator()));
  locator.registerLazySingleton(() => GetExperiences(repository: locator()));

  //blogs
  locator.registerLazySingleton(() => GetBlogs(repository: locator()));

  /// repository
  //candidates
  locator.registerLazySingleton<CandidateRepository>(
    () => CandidateRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  //blogs
  locator.registerLazySingleton<BlogRepository>(
    () => BlogRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  /// data sources
  // candidates
  locator.registerLazySingleton<CandidateRemoteDataSource>(
      () => CandidateRemoteDataSourceImpl(apiClient: locator()));

  locator.registerLazySingleton<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(apiClient: locator()));

  //***** EXTERNAL ****
  //dio
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton<ApiClient>(() => ApiClient(dio: locator()));
}
