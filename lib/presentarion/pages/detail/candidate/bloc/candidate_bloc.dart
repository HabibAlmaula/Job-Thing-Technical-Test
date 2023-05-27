import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_thing_technical_test/common/app_enum.dart';
import 'package:job_thing_technical_test/common/constant/app_colors.dart';
import 'package:job_thing_technical_test/domain/entities/address.dart';
import 'package:job_thing_technical_test/domain/entities/candidate.dart';
import 'package:job_thing_technical_test/domain/entities/email.dart';
import 'package:job_thing_technical_test/domain/entities/experience.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_address.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_emails.dart';
import 'package:job_thing_technical_test/domain/usecases/candidate/get_experiences.dart';

part 'candidate_event.dart';

part 'candidate_state.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  final GetEmails _getEmails;
  final GetAddress _getAddress;
  final GetExperiences _getExperiences;

  CandidateBloc(
      {required GetAddress getAddress,
      required GetEmails getEmails,
      required GetExperiences getExperiences})
      : _getEmails = getEmails,
        _getAddress = getAddress,
        _getExperiences = getExperiences,
        super(const CandidateState()) {
    on<OnInitData>(_onInitData);
    on<OnFetchAllData>(_onFetchAllData);
  }

  void _onInitData(OnInitData event, Emitter<CandidateState> emit) {
    emit(state.copyWith(mainCandidate: event.candidate));
  }

  Future<void> _onFetchAllData(
      OnFetchAllData event, Emitter<CandidateState> emit) async {
    emit(state.copyWith(mainRequestState: RequestState.Loading));

    final results = await Future.wait([
      _getEmails.execute(),
      _getAddress.execute(),
      _getExperiences.execute(),
    ]);

    for (final result in results) {
      result.fold(
        (l) => emit(state.copyWith(
            mainRequestState: RequestState.Error, mainMessage: l.message)),
        (r) {
          if (r is List<Email>) {
            final email = r.firstWhereOrNull(
                (element) => element.id == state.mainCandidate?.id);
            emit(state.copyWith(emailCandidate: email));
          } else if (r is List<Address>) {
            final address = r.firstWhereOrNull(
                (element) => element.id == state.mainCandidate?.id);
            emit(state.copyWith(addressCandidate: address));
          } else if (r is List<Experience>) {
            final experience = r.firstWhereOrNull(
                (element) => element.id == state.mainCandidate?.id);
            emit(state.copyWith(experienceCandidate: experience));
            switch (experience?.status) {
              case CandidateStatus.Hired:
                emit(state.copyWith(statusColor: AppColors.prismGreen_60));
                break;
              case CandidateStatus.KIV:
                emit(state.copyWith(statusColor: AppColors.prismYellow_50));
                break;
              case CandidateStatus.Rejected:
                emit(state.copyWith(statusColor: AppColors.prismRed_50));
                break;
              case CandidateStatus.Shortlisted:
                emit(state.copyWith(statusColor: AppColors.prismOrange_50));
                break;
              default:
                break;
            }
          }
        },
      );
    }
    emit(state.copyWith(mainRequestState: RequestState.Loaded));
  }
}
