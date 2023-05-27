import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_thing_technical_test/common/app_enum.dart';
import 'package:job_thing_technical_test/domain/entities/blog.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/domain/usecases/blog/get_blogs.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_candidates.dart';
import 'package:logger/logger.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCandidate _getCandidate;
  final GetBlogs _getBlogs;

  HomeBloc({required GetCandidate getCandidate, required GetBlogs getBlogs})
      : _getCandidate = getCandidate,
        _getBlogs = getBlogs,
        super(const HomeState()) {
    on<OnFetchData>(_onFetchData);
    on<OnSearchData>(_onSearchData);
  }

  Future<void> _onFetchData(OnFetchData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        candidatesRequestState: RequestState.Loading,
        blogsRequestState: RequestState.Loading));

    final result = await Future.wait([
      _getCandidate.execute(),
      _getBlogs.execute(),
    ]);

    result.first.fold(
      (err) {
        Logger().e(err.message);
        emit(state.copyWith(
          candidatesRequestState: RequestState.Error,
          candidatesMessage: err.message,
        ));
      },
      (success) => emit(
        state.copyWith(
            candidatesRequestState: RequestState.Loaded,
            candidates: success as List<Candidate>),
      ),
    );

    result.last.fold(
      (err) {
        Logger().e(err.message);
        emit(state.copyWith(
          blogsRequestState: RequestState.Error,
          blogsMessage: err.message,
        ));
      },
      (success) => emit(
        state.copyWith(
            blogsRequestState: RequestState.Loaded,
            blogs: success as List<Blog>),
      ),
    );
    final List<dynamic> mixedData = [...state.candidates, ...state.blogs];
    //mix the data orders
    mixedData.shuffle(Random());

    Logger().i("MixedData => $mixedData");
    //emit to main state
    emit(state.copyWith(mixedData: mixedData));
  }

  Future<void> _onSearchData(
      OnSearchData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(searchQuery: event.query));
  }
}
