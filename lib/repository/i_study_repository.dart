import 'package:health/study/model/study_model.dart';

abstract class IStudyRepository {
  Future<List<StudyModel>> findAllStudies();
}
