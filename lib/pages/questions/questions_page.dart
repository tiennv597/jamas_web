import 'package:jamas_web/helpers/enumerators.dart';
import 'package:jamas_web/locator.dart';
import 'package:jamas_web/pages/login/login.dart';
import 'package:jamas_web/provider/app_provider.dart';
import 'package:jamas_web/provider/tables.dart';
import 'package:jamas_web/rounting/route_names.dart';
import 'package:jamas_web/services/navigation_service.dart';
import 'package:jamas_web/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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
    final TablesProvider tablesProvider = Provider.of<TablesProvider>(context);
    final AppProvider appProvider = Provider.of<AppProvider>(context);
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
                title: !tablesProvider.isSearch
                    ? RaisedButton.icon(
                        onPressed: () {
                          appProvider
                              .changeCurrentPage(DisplayedPage.QUESTIONS);
                          locator<NavigationService>()
                              .navigateTo(QuestionAddRoute);
                        },
                        icon: Icon(Icons.add),
                        label: Text("Thêm câu hỏi"))
                    : null,
                actions: [
                  if (tablesProvider.isSearch)
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  tablesProvider.isSearch = false;
                                });
                              }),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.search), onPressed: () {})),
                    )),
                  if (!tablesProvider.isSearch)
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            tablesProvider.isSearch = true;
                          });
                        })
                ],
                headers: tablesProvider.questionsTableHeader,
                source: tablesProvider.questionsTableSource,
                selecteds: tablesProvider.selecteds,
                showSelect: tablesProvider.showSelect,
                autoHeight: false,
                onTabRow: (data) {
                  print(data);
                },
                onSort: tablesProvider.onSort,
                sortAscending: tablesProvider.sortAscending,
                sortColumn: tablesProvider.sortColumn,
                isLoading: tablesProvider.isLoading,
                onSelect: tablesProvider.onSelected,
                onSelectAll: tablesProvider.onSelectAll,
                footers: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Rows per page:"),
                  ),
                  if (tablesProvider.perPages != null)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton(
                          value: tablesProvider.currentPerPage,
                          items: tablesProvider.perPages
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (value) {}),
                    ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        "${tablesProvider.currentPage} - ${tablesProvider.currentPage} of ${tablesProvider.total}"),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                    ),
                    onPressed: tablesProvider.previous,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: tablesProvider.next,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  )
                ],
              ),
            ),
          ),
        ]));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
