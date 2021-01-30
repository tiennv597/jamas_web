import 'package:ecommerce_admin_tut/pages/questions/controller/question_controller.dart';
import 'package:ecommerce_admin_tut/pages/questions/widgets_questions/add_form1.dart';
import 'package:ecommerce_admin_tut/pages/questions/widgets_questions/add_form2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormAddQuestion extends StatefulWidget {
  @override
  _FormAddQuestionState createState() => _FormAddQuestionState();
}

class _FormAddQuestionState extends State<FormAddQuestion> {
  final QuestionController questionCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    switch (questionCtr.formCode) {
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
