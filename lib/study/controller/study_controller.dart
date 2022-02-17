import 'package:get/get.dart';
import 'package:health/repository/i_study_repository.dart';
import 'package:health/study/model/study_model.dart';

class StudyController extends GetxController with StateMixin {
  final IStudyRepository _studyRepository;

  StudyController(this._studyRepository);

  RxList<StudyModel> studies = <StudyModel>[].obs;

  var rowIndex = 0.obs;
  var sortColumnIndex = 1.obs;
  var sortAscending = true.obs;
  var availableRowsPerPage = <int>[];
  var rowsPerPage = 7.obs;

  @override
  void onInit() {
    findStudies();
    super.onInit();
  }

  Future<void> findStudies() async {
    studies.clear();

    change(studies, status: RxStatus.loading());

    try {
      studies.addAll(await _studyRepository.findAllStudies());
      availablePerPage();
      onSortStudies(sortColumnIndex.value, sortAscending.value);
      change(studies, status: RxStatus.success());
    } catch (e) {
      print('Controller: $e');
      change([], status: RxStatus.error('Erro ao buscar estudos'));
    }
  }

  Future<List<int>> availablePerPage() async {
    var sequence = (studies.length / rowsPerPage.value).floor();
    for (var i = 1; i <= sequence; i++) {
      availableRowsPerPage.add(rowsPerPage.value * i);
    }
    return availableRowsPerPage;
  }

  Future<void> onSortStudies(int columnIndex, bool ascending) async {
    try {
      if (columnIndex == 0) {
        studies.sort((a, b) {
          final aValue = a.studyDateTime;
          final bValue = b.studyDateTime;

          return ascending
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
      } else if (columnIndex == 1) {
        studies.sort((a, b) {
          final aValue = a.patientName.value.first['Alphabetic'];
          final bValue = b.patientName.value.first['Alphabetic'];

          return ascending
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
      } else if (columnIndex == 2) {
        studies.sort((a, b) {
          final aValue = a.studyDescription.value.first;
          final bValue = b.studyDescription.value.first;

          return ascending
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
      } else if (columnIndex == 3) {
        studies.sort((a, b) {
          final aValue = a.studyModality.value.toString();
          final bValue = b.studyModality.value.toString();

          return ascending
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
      }

      sortColumnIndex.value = columnIndex;
      sortAscending.value = ascending;

      change(studies, status: RxStatus.success());
    } catch (e) {
      print('Controller: $e');
      change([], status: RxStatus.error('Erro ao classificar estudos'));
    }
  }

  Future<void> onRowsPerPageChanged(int value) async {
    try {
      rowsPerPage.value = value;
      change(rowsPerPage, status: RxStatus.success());
    } catch (e) {
      print('Controller: $e');
      change([], status: RxStatus.error('Erro ao contabilizar estudos'));
    }
  }

  Future<void> updateRowIndex(int value) async {
    try {
      rowIndex.value = value;
      change(rowIndex, status: RxStatus.success());
    } catch (e) {
      print('Controller: $e');
      change([], status: RxStatus.error('Erro ao contabilizar estudos'));
    }
  }
}
