part of 'candidate_bloc.dart';

sealed class CandidateEvent extends Equatable {
  const CandidateEvent();

  @override
  List<Object?> get props => [];
}

final class OnInitData extends CandidateEvent {
  final Candidate candidate;

  const OnInitData({required this.candidate});

  @override
  List<Object?> get props => [candidate];
}

final class OnFetchAllData extends CandidateEvent {}
