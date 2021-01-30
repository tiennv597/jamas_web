import 'package:jamas_web/pages/questions/widgets_questions/set_form.dart';
import 'package:jamas_web/provider/tables.dart';
import 'package:jamas_web/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'controller/question_controller.dart';
import 'package:jamas_web/widgets/widgets.dart';

import 'dialog/dialog_confirm_question.dart';
import 'widgets_questions/add_form1.dart';

// Trang hiển thị thêm câu hỏi và xác nhận thêm câu hỏi
class QuestionAddPage extends StatefulWidget {
  @override
  _QuestionAddPageState createState() => _QuestionAddPageState();
}

class _QuestionAddPageState extends State<QuestionAddPage> {
  final QuestionController questionCtr = Get.find();
  @override
  Widget build(BuildContext context) {
    final TablesProvider tablesProvider = Provider.of<TablesProvider>(context);
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            PageHeader(
              text: 'Thêm câu hỏi',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Chọn cấp độ câu hỏi
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: questionCtr.selectedLevel,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 16,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 1,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          questionCtr.changeLevel(newValue);
                          setState(() {
                            questionCtr.selectedLevel = newValue;
                          });
                        },
                        items: questionCtr.level
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    //Chọn thể loại câu hỏi
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: questionCtr.selectedType,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 16,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 1,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          questionCtr.changeType(newValue);
                          setState(() {
                            questionCtr.selectedType = newValue;
                          });
                        },
                        items: questionCtr.type
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    //Chọn thể loại con của câu hỏi
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: questionCtr.selectedSubType,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 16,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 1,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          questionCtr.changeSubType(newValue);
                          setState(() {
                            questionCtr.selectedSubType = newValue;
                          });
                        },
                        items: questionCtr.subType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )
              ],
            ),
            FormAddQuestion(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      RaisedButton(
                        onPressed: () {
//                          DialogConfirmQuestion();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  DialogConfirmQuestion());
                        },
                        child:
                            Text("Lưu câu hỏi", style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
    ));
  }
}
