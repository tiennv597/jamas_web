import 'package:jamas_web/pages/questions/controller/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// form ứng với mỗi loại câu hỏi khác nhau
class AddForm1 extends StatefulWidget {
  @override
  _AddForm1State createState() => _AddForm1State();
}

class _AddForm1State extends State<AddForm1> {
  final QuestionController questionCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Nhập nội dung của câu hỏi
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: questionCtr.contentController,
                onChanged: (text) {
                  questionCtr.questionModel.value.content = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Nhập nội dung câu hỏi'),
              )
            ],
          ),
          //Đáp án 1
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 14, right: 8),
                      child: Radio(
                          value: 1,
                          groupValue: questionCtr.answer,
                          onChanged: (dynamic value) {
                            setState(() {
                              questionCtr.answer = value;
                            });
                          })),
                  new Flexible(
                    child: new TextField(
                      controller: questionCtr.answer1Controller,
                      onChanged: (text) {
                        questionCtr.questionModel.value.answer1 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 1'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 2
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 2,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      controller: questionCtr.answer2Controller,
                      onChanged: (text) {
                        questionCtr.questionModel.value.answer2 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 2'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 3
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 3,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      controller: questionCtr.answer3Controller,
                      onChanged: (text) {
                        questionCtr.questionModel.value.answer3 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 3'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 4
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 4,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      controller: questionCtr.answer4Controller,
                      onChanged: (text) {
                        questionCtr.questionModel.value.answer4 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 4'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Nhập nội dung phần giải thích
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: questionCtr.explainController,
                onChanged: (text) {
                  questionCtr.explain = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration:
                    InputDecoration(labelText: 'Nhập nội dung phần giải thích'),
              )
            ],
          ),

          // Nhập nội dung cần gạch chân
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: questionCtr.underlineController,
                onChanged: (text) {
                  questionCtr.addUnderline(text);
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration:
                    InputDecoration(labelText: 'Nhập nội dung cần gạch chân'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
