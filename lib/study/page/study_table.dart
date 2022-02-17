import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:health/study/controller/study_controller.dart';
import 'package:health/study/model/study_model.dart';
import 'package:intl/intl.dart';

class StudyTable extends DataTableSource {
  StudyController controller = Get.find<StudyController>();

  //StudyTable(this.context);

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    final study = controller.studies[index];

    final cells = [
      DateFormat('dd/MM/yyyy - hh:mm:ss').format(study.studyDateTime),
      [
        study.patientName.value.first['Alphabetic'].toString(),
        study.patientID.value.first.toString(),
        study.patientSex.value.first.toString(),
      ],
      study.studyDescription.value.first,
      study.studyModality.value
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', ''),
      _getActions(study),
    ];

    return DataRow.byIndex(
      index: index,
      color:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (index % 2 == 0) {
          return Colors.red.withOpacity(0.3);
        } else {
          return Colors.red.withOpacity(0.4);
        }
        /*
        if (states.contains(MaterialState.selected))
          return Colors.blue.withOpacity(0.1);
        else
          return Colors.red.withOpacity(0.5);*/
      }),

      /*
      color: MaterialStateColor.resolveWith((state) {
        if (index % 2 == 0) {
          return Colors.red[200]!;
        } else {
          return Colors.red[300]!;
        }
      }),
      */
      cells: _getCells(cells),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.studies.length;

  @override
  int get selectedRowCount => _selectedCount;

  List<DataCell> _getCells(List<dynamic> cells) => cells
      .map(
        (e) => DataCell(
          e is List<String>
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e[0],
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            e[1],
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          e[2],
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : e is List<IconButton>
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: e,
                    )
                  : Center(
                      child: Text(
                        e,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    ),
        ),
      )
      .toList();

  List<IconButton> _getActions(StudyModel study) {
    return [
      IconButton(
        onPressed: () {
          print('Visualizar');
        },
        icon: const Icon(Icons.visibility),
      ),
      IconButton(
        onPressed: () {
          print('Adcionar');
        },
        icon: const Icon(Icons.note_add),
      ),
      IconButton(
        onPressed: () {
          print('Visualizar');
        },
        icon: const Icon(Icons.visibility),
      ),
      IconButton(
        onPressed: () {
          print('Adcionar');
        },
        icon: const Icon(Icons.note_add),
      ),
      IconButton(
        onPressed: () {
          print('Adcionar');
        },
        icon: const Icon(Icons.note_add),
      )
    ];
  }

  List<DataColumn> getColumns() {
    final columns = [
      'Data do exame',
      'Nome do paciente',
      'Procedimento realizado',
      'Modalidade',
      'Opções de exame',
    ];
    return columns
        .map(
          (String column) => DataColumn(
            tooltip: column,
            label: Center(
              child: Text(column.split(' ').first),
            ),
            onSort: (columnIndex, ascending) =>
                controller.onSortStudies(columnIndex, ascending),
          ),
        )
        .toList();
  }
}
