import 'package:equatable/equatable.dart';
import 'package:job_thing_technical_test/common/app_enum.dart';
import 'package:job_thing_technical_test/domain/entities/experience.dart';

class ExperienceModel extends Equatable {
  final int id;
  final CandidateStatus status;
  final String jobTitle;
  final String companyName;
  final String industry;

  const ExperienceModel({
    required this.id,
    required this.status,
    required this.jobTitle,
    required this.companyName,
    required this.industry,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        id: json["id"],
        status: CandidateStatus.values.firstWhere((s) => s.toString().split('.').last == json["status"]) ,
        jobTitle: json["job_title"],
        companyName: json["company_name"],
        industry: json["industry"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "job_title": jobTitle,
        "company_name": companyName,
        "industry": industry,
      };

  Experience toEntity() {
    return Experience(
        id: id,
        status: status,
        jobTitle: jobTitle,
        companyName: companyName,
        industry: industry);
  }

  @override
  List<Object?> get props => [
        id,
        status,
        jobTitle,
        companyName,
        industry,
      ];
}
