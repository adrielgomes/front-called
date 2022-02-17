import 'dart:convert';

import 'package:health/shared/custom_dio.dart';

import 'package:health/study/model/study_model.dart';
import 'package:health/repository/i_study_repository.dart';

class StudyRepositoryGetConnect implements IStudyRepository {
  final CustomDio restClient;

  StudyRepositoryGetConnect(this.restClient);

  @override
  Future<List<StudyModel>> findAllStudies() async {
    try {
      return restClient.get('/studies?includefield=all&offset=0').then((res) =>
          (jsonDecode(res.data) as List)
              .map((e) => StudyModel.fromJson(e))
              .toList());
    } on Exception catch (e) {
      print('Repository: $e');
      rethrow;
    }
  }
}
