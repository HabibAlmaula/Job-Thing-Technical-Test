import 'package:equatable/equatable.dart';
import 'package:job_thing_technical_test/common/app_enum.dart';

class Experience extends Equatable {
  final int id;
  final CandidateStatus status;
  final String jobTitle;
  final String companyName;
  final String industry;

  const Experience({
    required this.id,
    required this.status,
    required this.jobTitle,
    required this.companyName,
    required this.industry,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        jobTitle,
        companyName,
        industry,
      ];
}
