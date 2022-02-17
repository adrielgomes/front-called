import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:health/repository/i_study_repository.dart';
import 'package:health/shared/custom_dio.dart';
import 'package:health/study/repository/study_repository.dart';

import '../controller/study_controller.dart';

class StudyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomDio(dio: Dio()));
    Get.put<IStudyRepository>(StudyRepositoryGetConnect(Get.find()));
    Get.put(StudyController(Get.find()));
  }
}
