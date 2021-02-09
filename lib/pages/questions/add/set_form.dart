import 'package:jamas_web/pages/questions/add/form1/add_form1.dart';
import 'package:jamas_web/pages/questions/add/form2/add_form2.dart';
import 'package:jamas_web/pages/questions/add/form3/form3.dart';
import 'package:flutter/material.dart';

class FormAddQuestion extends StatelessWidget {
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
      case '3':
        {
          return AddForm3();
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
