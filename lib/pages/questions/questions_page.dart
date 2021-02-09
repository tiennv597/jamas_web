import 'package:jamas_web/locator.dart';
import 'package:jamas_web/rounting/route_names.dart';
import 'package:jamas_web/services/navigation_service.dart';
import 'package:jamas_web/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_table/ResponsiveDatatable.dart';
import 'package:responsive_table/responsive_table.dart';
import 'controller/question_controller.dart';

// Page này là trang chính của phần câu hỏi: thêm, xửa , xóa, cập nhật
class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final questionCtr = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
          PageHeader(
            text: 'Câu hỏi',
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxHeight: 700,
            ),
            child: Card(
              elevation: 1,
              shadowColor: Colors.black,
              clipBehavior: Clip.none,
              child: ResponsiveDatatable(
                title: context.isTablet
                    ? RaisedButton.icon(
                        onPressed: () {
                          locator<NavigationService>()
                              .navigateTo(QuestionAddRoute);
                        },
                        icon: Icon(Icons.add),
                        label: Text("Thêm câu hỏi"))
                    : null,
                actions: [
                  if (context.isTablet)
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  //context.isTablet = false;
                                });
                              }),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.search), onPressed: () {})),
                    )),
                  if (!context.isTablet)
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            //context.isTablet = true;
                          });
                        })
                ],
                //headers: tablesProvider.questionsTableHeader,
                //source: tablesProvider.questionsTableSource,
                //selecteds: tablesProvider.selecteds,
                //showSelect: tablesProvider.showSelect,
                autoHeight: false,
                onTabRow: (data) {
                  print(data);
                },
                // onSort: tablesProvider.onSort,
                // sortAscending: tablesProvider.sortAscending,
                // sortColumn: tablesProvider.sortColumn,
                // isLoading: tablesProvider.isLoading,
                // onSelect: tablesProvider.onSelected,
                // onSelectAll: tablesProvider.onSelectAll,
                footers: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Rows per page:"),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
