part of 'candidate_bloc.dart';

class CandidateState extends Equatable {
  const CandidateState({
    this.mainCandidate,
    this.addressCandidate,
    this.emailCandidate,
    this.experienceCandidate,
    this.mainRequestState = RequestState.Empty,
    this.mainMessage = '',
    this.statusColor,
  });

  final Candidate? mainCandidate;
  final Email? emailCandidate;
  final Experience? experienceCandidate;
  final Address? addressCandidate;

  final RequestState mainRequestState;
  final String mainMessage;

  final Color? statusColor;

  CandidateState copyWith(
      {Candidate? mainCandidate,
      Email? emailCandidate,
      Experience? experienceCandidate,
      Address? addressCandidate,
      RequestState? mainRequestState,
      String? mainMessage,
      Color? statusColor}) {
    return CandidateState(
        mainCandidate: mainCandidate ?? this.mainCandidate,
        emailCandidate: emailCandidate ?? this.emailCandidate,
        addressCandidate: addressCandidate ?? this.addressCandidate,
        experienceCandidate: experienceCandidate ?? this.experienceCandidate,
        mainRequestState: mainRequestState ?? this.mainRequestState,
        mainMessage: mainMessage ?? this.mainMessage,
        statusColor: statusColor ?? this.statusColor);
  }

  @override
  List<Object?> get props => [
        mainCandidate,
        emailCandidate,
        experienceCandidate,
        addressCandidate,
        mainRequestState,
        mainMessage,
        statusColor,
      ];
}
