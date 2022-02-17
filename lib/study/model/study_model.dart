import 'study_type.dart';

class StudyModel {
  DicomTag studyDate;
  DicomTag studyTime;
  DateTime studyDateTime;
  DicomTag studyModality;
  DicomTag studyDescription;
  DicomTag studyInstanceUID;
  DicomTag patientID;
  DicomTag patientName;
  DicomTag patientBirthDate;
  DicomTag patientAge;
  DicomTag patientSex;

  StudyModel({
    required this.studyDate,
    required this.studyTime,
    required this.studyDateTime,
    required this.studyModality,
    required this.studyDescription,
    required this.studyInstanceUID,
    required this.patientID,
    required this.patientName,
    required this.patientBirthDate,
    required this.patientAge,
    required this.patientSex,
  });

  factory StudyModel.fromJson(Map<String, dynamic> json) {
    return StudyModel(
      studyDate: json['00080020'] != null
          ? DicomTag.fromJson(json['00080020'])
          : DicomTag(),
      studyTime: json['00080030'] != null
          ? DicomTag.fromJson(json['00080030'])
          : DicomTag(),
      studyDateTime: json['00080020'] != null && json['00080030'] != null
          ? DateTime.parse(DicomTag.fromJson(json['00080020']).value.first +
              ' ' +
              DicomTag.fromJson(json['00080030']).value.first)
          : DateTime.now(),
      studyModality: json['00080061'] != null
          ? DicomTag.fromJson(json['00080061'])
          : DicomTag(),
      studyDescription: json['00081030'] != null
          ? DicomTag.fromJson(json['00081030'])
          : DicomTag(),
      studyInstanceUID: json['0020000D'] != null
          ? DicomTag.fromJson(json['0020000D'])
          : DicomTag(),
      patientID: json['00100020'] != null
          ? DicomTag.fromJson(json['00100020'])
          : DicomTag(),
      patientName: json['00100010'] != null
          ? DicomTag.fromJson(json['00100010'])
          : DicomTag(),
      patientBirthDate: json['00100030'] != null
          ? DicomTag.fromJson(json['00100030'])
          : DicomTag(),
      patientAge: json['00101010'] != null
          ? DicomTag.fromJson(json['00101010'])
          : DicomTag(),
      patientSex: json['00100040'] != null
          ? DicomTag.fromJson(json['00100040'])
          : DicomTag(),
    );
  }
}
