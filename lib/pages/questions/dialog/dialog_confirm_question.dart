import 'package:jamas_web/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:jamas_web/pages/questions/controller/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//class DialogConfirmQuestion extends StatefulWidget {
//  @override
//  _DialogConfirmQuestionState createState() => _DialogConfirmQuestionState();
//}

class DialogConfirmQuestion extends StatelessWidget {
  final QuestionController questionCtr = Get.find();
  @override
  Widget build(BuildContext context) {
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
  }
}
