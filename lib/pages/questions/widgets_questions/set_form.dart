import 'package:jamas_web/pages/questions/controller/question_controller.dart';
import 'package:jamas_web/pages/questions/widgets_questions/add_form1.dart';
import 'package:jamas_web/pages/questions/widgets_questions/add_form2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//class FormAddQuestion extends StatefulWidget {
//  @override
//  _FormAddQuestionState createState() => _FormAddQuestionState();
//}

class FormAddQuestion extends StatelessWidget {
//  final QuestionController questionCtr = Get.find();
  final String formCode;

  FormAddQuestion(this.formCode);

  @override
  Widget build(BuildContext context) {
    switch (formCode) {
      case '1':
        {
          return AddForm1();
        }
        break;

      case '2':
        {
          return AddForm2();
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
