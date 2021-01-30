import 'package:ecommerce_admin_tut/pages/questions/widgets_questions/set_form.dart';
import 'package:ecommerce_admin_tut/provider/tables.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'controller/question_controller.dart';
import 'package:ecommerce_admin_tut/widgets/widgets.dart';

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
                          _showMyDialog();
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xác nhận thêm câu hỏi'),
          content: Container(
            width: Get.width / 3,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cấp độ: ${questionCtr.selectedLevel}.'),
                        Text(
                            'Thể loại: ${questionCtr.selectedType}(${questionCtr.selectedSubType})'),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Câu hỏi: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextUnderline(
                          text: questionCtr.content,
                          underline: questionCtr.underline,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // đáp án 1
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Radio(
                                focusColor: Colors.cyanAccent,
                                value: 1,
                                groupValue: questionCtr.answer,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text('${questionCtr.answerContent1}.'),
                              )
                            ],
                          ),
                          // đáp án 2
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Radio(
                                value: 2,
                                groupValue: questionCtr.answer,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text('${questionCtr.answerContent2}.'),
                              )
                            ],
                          ),
                          // đáp án 3
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Radio(
                                value: 3,
                                groupValue: questionCtr.answer,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text('${questionCtr.answerContent3}.'),
                              )
                            ],
                          ),
                          // đáp án 4
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Radio(
                                value: 4,
                                groupValue: questionCtr.answer,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text('${questionCtr.answerContent4}.'),
                              )
                            ],
                          ),
                          // Nội dung giải thích
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Giải thích: ${questionCtr.explain}.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                child: Text("Hủy")),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.green,
                child: Text("Lưu")),
          ],
        );
      },
    );
  }
}
