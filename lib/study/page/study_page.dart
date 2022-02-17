import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/study/controller/study_controller.dart';
import 'package:health/study/page/study_table.dart';

class StudyPage extends GetView<StudyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: getDataTable(),
      ),
    );
  }

/*
  Widget getDataTable2() => controller.obx((state) {
        final table = StudyTable();

        return ListView(
          children: [
            PaginatedDataTable(
              columnSpacing: 0,
              header: Text('Lista de Estudos'),
              actions: [
                IconButton(
                  onPressed: () {
                    print(controller.studies.length);
                  },
                  icon: const Icon(Icons.refresh),
                )
              ],
              onRowsPerPageChanged: (value) =>
                  controller.onRowsPerPageChanged(value!),
              availableRowsPerPage: controller.availableRowsPerPage,
              rowsPerPage: controller.rowsPerPage.value,
              columns: table.getColumns(),
              source: table,
              sortColumnIndex: controller.sortColumnIndex.value,
              sortAscending: controller.sortAscending.value,
            ),
          ],
        );
      });
*/
  Widget getDataTable() => controller.obx(
        (state) {
          return PaginatedDataTable2(
            horizontalMargin: 0,
            checkboxHorizontalMargin: 0,
            columnSpacing: 0,
            wrapInCard: false,
            header: Center(
              child: Text('Lista de Estudos'),
            ),
            minWidth: 100,
            fit: FlexFit.tight,
            columns: StudyTable().getColumns(),
            source: StudyTable(),
            sortColumnIndex: controller.sortColumnIndex.value,
            sortAscending: controller.sortAscending.value,
            rowsPerPage: controller.rowsPerPage.value,
            availableRowsPerPage: controller.availableRowsPerPage,
            initialFirstRowIndex: controller.rowIndex.value,
            onPageChanged: (value) => controller.updateRowIndex(value),
            onRowsPerPageChanged: (value) =>
                controller.onRowsPerPageChanged(value!),
            empty: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.green[200],
                child: Text('Não há exames'),
              ),
            ),
          );
        },
      );
}
